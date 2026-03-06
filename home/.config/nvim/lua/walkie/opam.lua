-- Minimal opam integration for Neovim.
--
-- Features:
-- - `:OpamSwitch`      Pick a switch via `vim.ui.select()` and apply `opam env`
-- - `:OpamSwitchAuto`  Try to auto-select a local switch (detect `_opam/`)
-- - Optional auto-mode (enabled by Coqtail) that activates when opening certain filetypes.
--
-- Notes / limitations:
-- - This updates Neovim's `vim.env` only (it does not change your shell environment).
-- - Only processes spawned *after* switching (LSP servers, `:!` commands, etc.) see the updated env.
-- - Auto-switching is designed for opam "local switches" created in a project directory.

local M = {}

local state = {
  last_auto_switch = nil,
}

local function trim(s)
  return (s:gsub("^%s+", ""):gsub("%s+$", ""))
end

local function parse_opam_env_sexp(sexp)
  -- `opam env --sexp` returns:
  -- (
  --   ("VAR" "VALUE")
  --   ...
  -- )
  local out = {}
  local i = 1

  local function parse_quoted(start_at)
    local buf = {}
    local j = start_at
    while j <= #sexp do
      local c = sexp:sub(j, j)
      if c == "\\" then
        local n = sexp:sub(j + 1, j + 1)
        if n == "\\" or n == '"' then
          table.insert(buf, n)
          j = j + 2
        else
          table.insert(buf, n)
          j = j + 2
        end
      elseif c == '"' then
        return table.concat(buf), j + 1
      else
        table.insert(buf, c)
        j = j + 1
      end
    end
    return table.concat(buf), j
  end

  while true do
    local p = sexp:find('%(%s*"', i)
    if not p then
      break
    end
    local q1 = sexp:find('"', p)
    if not q1 then
      break
    end
    local key, after_key = parse_quoted(q1 + 1)
    local q2 = sexp:find('"', after_key)
    if not q2 then
      break
    end
    local val, after_val = parse_quoted(q2 + 1)
    out[key] = val
    i = after_val
  end

  return out
end

local function run(cmd, opts)
  opts = opts or {}
  local res = vim.system(cmd, { text = true, cwd = opts.cwd }):wait()
  if res.code ~= 0 then
    local stderr = trim(res.stderr or "")
    local stdout = trim(res.stdout or "")
    return nil, (stderr ~= "" and stderr) or (stdout ~= "" and stdout) or ("opam exited with " .. res.code)
  end
  return res.stdout or "", nil
end

function M.list_switches()
  local stdout, err = run({ "opam", "switch", "list", "--short", "--safe" })
  if not stdout then
    return nil, err
  end
  local switches = {}
  for line in stdout:gmatch("[^\n]+") do
    line = trim(line)
    if line ~= "" then
      table.insert(switches, line)
    end
  end
  return switches, nil
end

function M.activate_switch(switch, opts)
  opts = opts or {}
  if not opts.force and vim.env.OPAMSWITCH == switch then
    return true
  end

  local stdout, err = run({ "opam", "env", "--switch", switch, "--set-switch", "--sexp" })
  if not stdout then
    vim.notify(("opam env failed: %s"):format(err), vim.log.levels.ERROR)
    return false
  end

  local env = parse_opam_env_sexp(stdout)
  for k, v in pairs(env) do
    vim.env[k] = v
  end

  vim.notify(("OPAM switch set: %s"):format(switch), vim.log.levels.INFO)
  return true
end

function M.select_switch()
  local switches, err = M.list_switches()
  if not switches then
    vim.notify(("Failed to list opam switches: %s"):format(err), vim.log.levels.ERROR)
    return
  end

  local current = vim.env.OPAMSWITCH
  vim.ui.select(switches, {
    prompt = "Select opam switch",
    format_item = function(item)
      if current and current ~= "" and item == current then
        return ("* %s"):format(item)
      end
      return ("  %s"):format(item)
    end,
  }, function(choice)
    if not choice then
      return
    end
    M.activate_switch(choice)
  end)
end

local function find_local_switch_root(dir)
  local found = vim.fs.find("_opam", { path = dir, upward = true, type = "directory" })[1]
  if not found then
    return nil
  end
  return vim.fs.dirname(found)
end

function M.auto_switch_for_buffer(bufnr)
  bufnr = bufnr or 0
  local name = vim.api.nvim_buf_get_name(bufnr)
  if name == "" then
    return
  end

  local dir = vim.fs.dirname(name)
  if not dir or dir == "" then
    return
  end

  local root = find_local_switch_root(dir)
  if not root then
    return
  end

  if state.last_auto_switch == root then
    return
  end
  state.last_auto_switch = root

  -- For local switches, opam uses the directory path as the switch name.
  M.activate_switch(root)
end

function M.setup(opts)
  opts = opts or {}

  vim.api.nvim_create_user_command("OpamSwitch", function()
    M.select_switch()
  end, {})

  vim.api.nvim_create_user_command("OpamSwitchAuto", function()
    M.auto_switch_for_buffer(0)
  end, {})

  local auto = opts.auto
  local filetypes = opts.filetypes or { "coq" }
  if auto then
    local group = vim.api.nvim_create_augroup("walkie-opam-auto-switch", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      pattern = filetypes,
      callback = function()
        M.auto_switch_for_buffer(0)
      end,
    })
  end
end

return M
