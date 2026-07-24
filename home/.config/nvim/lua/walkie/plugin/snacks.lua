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

vim.keymap.set("n", "<leader>ff", function()
  Snacks.picker.files()
end, { desc = "Find files" })

local function find_buffers()
  Snacks.picker.buffers({
    focus = "list",
    jump = { reuse_win = false },
    formatters = { file = { filename_first = true } },
    format = function(item, picker)
      local display_item = vim.tbl_extend("force", {}, item)
      display_item.pos = nil
      return Snacks.picker.format.buffer(display_item, picker)
    end,
    confirm = function(picker, item, action)
      if item then
        item.pos = nil
      end
      Snacks.picker.actions.jump(picker, item, action)
    end,
    win = {
      list = { keys = { ["<C-l>"] = "focus_preview" } },
    },
  })
end

vim.keymap.set("n", "B", find_buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fb", find_buffers, { desc = "Find buffers" })

vim.keymap.set("n", "<leader>fg", function()
  Snacks.picker.grep()
end, { desc = "Grep" })

vim.keymap.set("n", "<leader>fh", function()
  Snacks.picker.help()
end, { desc = "Help pages" })

vim.keymap.set("n", "<leader>fn", function()
  Snacks.picker.notifications()
end, { desc = "Notification history" })
