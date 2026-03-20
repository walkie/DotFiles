local Snacks = require("snacks")

local function set_snacks_indent_highlights()
  -- Snacks defaults `SnacksIndentScope` to `Special`, which is often too loud.
  -- Make the current-scope guide only slightly more visible than regular indent guides.
  vim.api.nvim_set_hl(0, "SnacksIndentScope", { link = "LineNr" })
end

Snacks.setup({
  input = { enabled = true },
  picker = { enabled = true },
  notifier = { enabled = true },
  indent = {
    enabled = false,
    animate = { enabled = false },
  },
})

set_snacks_indent_highlights()
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("walkie-snacks-highlights", { clear = true }),
  callback = set_snacks_indent_highlights,
})

vim.keymap.set("n", "<leader>ff", function()
  Snacks.picker.files()
end, { desc = "Find files" })

vim.keymap.set("n", "<leader>fb", function()
  Snacks.picker.buffers()
end, { desc = "Find buffers" })

vim.keymap.set("n", "<leader>fg", function()
  Snacks.picker.grep()
end, { desc = "Grep" })

vim.keymap.set("n", "<leader>fh", function()
  Snacks.picker.help()
end, { desc = "Help pages" })

vim.keymap.set("n", "<leader>fn", function()
  Snacks.picker.notifications()
end, { desc = "Notification history" })
