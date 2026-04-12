local blink = require("blink.cmp")

local function cursor_not_after_whitespace()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  if col == 0 then
    return false
  end

  local line = vim.api.nvim_buf_get_lines(0, row - 1, row, true)[1]
  return line:sub(col, col):match("%s") == nil
end

blink.setup({
  cmdline = { enabled = false },
  fuzzy = { implementation = "lua" },
  keymap = {
    preset = "none",
    ["<Tab>"] = {
      function(cmp)
        if cmp.is_visible() then
          return cmp.select_next()
        end
        if cursor_not_after_whitespace() then
          return cmp.show()
        end
      end,
      "fallback",
    },
    ["<S-Tab>"] = { "select_prev", "fallback" },
    ["<CR>"] = { "accept", "fallback" },
  },
  completion = {
    trigger = {
      show_on_keyword = false,
      show_on_trigger_character = false,
      show_on_accept_on_trigger_character = false,
      show_on_insert_on_trigger_character = false,
    },
    list = {
      selection = {
        preselect = true,
        auto_insert = false,
      },
    },
    menu = {
      auto_show = false,
      draw = {
        columns = {
          { "label", "label_description", gap = 1 },
          { "kind_icon", "kind", gap = 1 },
          { "source_name" },
        },
      },
    },
    documentation = { auto_show = true },
    ghost_text = { enabled = false },
  },
  sources = {
    default = { "lsp", "path", "buffer" },
    providers = {
      lsp = {
        name = "LSP",
        module = "blink.cmp.sources.lsp",
      },
      path = {
        name = "Path",
        module = "blink.cmp.sources.path",
      },
      buffer = {
        name = "Text",
        module = "blink.cmp.sources.buffer",
      },
    },
  },
})

local function toggle_completion(opts)
  if blink.is_visible() then
    blink.hide()
    return
  end
  blink.show(opts)
end

vim.keymap.set("i", "<C-Space>", function()
  toggle_completion()
end, { desc = "Show completion" })

vim.keymap.set("i", "<C-@>", function()
  toggle_completion()
end, { desc = "Show completion" })

vim.keymap.set("i", "<C-x><C-o>", function()
  toggle_completion({ providers = { "lsp" } })
end, { desc = "Show LSP completion" })

vim.keymap.set("i", "<C-x><C-f>", function()
  toggle_completion({ providers = { "path" } })
end, { desc = "Show path completion" })

vim.keymap.set("i", "<C-x><C-n>", function()
  toggle_completion({ providers = { "buffer" } })
end, { desc = "Show text completion" })

vim.keymap.set("i", "<Esc>", function()
  if blink.is_visible() then
    blink.cancel()
    return
  end
  vim.api.nvim_feedkeys(vim.keycode("<Esc>"), "n", false)
end, { desc = "Cancel completion or leave insert mode" })
