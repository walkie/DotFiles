-- Add keybindings to switch windows from embedded terminal
vim.keymap.set("t", "<c-h>", "<c-\\><c-n>:TmuxNavigateLeft<cr>",
  { silent = true, desc = "Switch to window to the left" })
vim.keymap.set("t", "<c-j>", "<c-\\><c-n>:TmuxNavigateDown<cr>",
  { silent = true, desc = "Switch to window below" })
vim.keymap.set("t", "<c-k>", "<c-\\><c-n>:TmuxNavigateUp<cr>",
  { silent = true, desc = "Switch to window above" })
vim.keymap.set("t", "<c-l>", "<c-\\><c-n>:TmuxNavigateRight<cr>",
  { silent = true, desc = "Switch to window to the right" })
