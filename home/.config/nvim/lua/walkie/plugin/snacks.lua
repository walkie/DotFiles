local Snacks = require("snacks")

Snacks.setup({
  input = { enabled = true },
  picker = { enabled = true },
  notifier = { enabled = true },
})

local function set_picker_highlights()
  vim.api.nvim_set_hl(0, "SnacksPicker", { link = "Normal" })
  vim.api.nvim_set_hl(0, "SnacksPickerBorder", { link = "Normal" })
  vim.api.nvim_set_hl(0, "SnacksPickerDelim", { link = "NonText" })
  vim.api.nvim_set_hl(0, "SnacksPickerRow", { link = "NonText" })
end

set_picker_highlights()
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("walkie-snacks-highlights", { clear = true }),
  callback = set_picker_highlights,
})

local function format_without_position(formatter)
  return function(item, picker)
    local display_item = vim.tbl_extend("force", {}, item)
    display_item.pos = nil
    return formatter(display_item, picker)
  end
end

local function confirm_at_last_position(picker, item, action)
  if item then
    item.pos = nil
  end
  Snacks.picker.actions.jump(picker, item, action)
end

local picker_options = {
  buffers = {
    jump = { reuse_win = false },
    formatters = { file = { filename_first = true } },
    format = format_without_position(Snacks.picker.format.buffer),
    confirm = confirm_at_last_position,
  },
  smart = {
    jump = { reuse_win = false },
    formatters = { file = { filename_first = true } },
    format = format_without_position(Snacks.picker.format.file),
    confirm = confirm_at_last_position,
  },
}

local function open_picker(name)
  return function()
    Snacks.picker[name](vim.deepcopy(picker_options[name]))
  end
end

local picker_mappings = {
  { "B", "smart", "Smart picker" },
  { "<leader>ff", "files", "Find files" },
  { "<leader>fb", "buffers", "Find buffers" },
  { "<leader>fg", "grep", "Grep" },
  { "<leader>fs", "lsp_workspace_symbols", "Workspace symbols" },
  { "<leader>fh", "help", "Help pages" },
  { "<leader>fp", "projects", "Projects" },
  { "<leader>fl", "git_log", "Git log" },
  { "<leader>ft", "todo_comments", "Todo comments" },
  { "<leader>fd", "lsp_definitions", "Definitions" },
  { "<leader>fr", "lsp_references", "References" },
  { "<leader>fn", "notifications", "Notification history" },
  { "<leader>ss", "spelling", "Spelling suggestions" },
}

for _, mapping in ipairs(picker_mappings) do
  vim.keymap.set("n", mapping[1], open_picker(mapping[2]), { desc = mapping[3] })
end
