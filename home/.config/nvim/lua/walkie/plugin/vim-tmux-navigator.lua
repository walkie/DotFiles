-- Normal-mode navigation
vim.keymap.set("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>",
  { silent = true, desc = "Switch to window to the left" })
vim.keymap.set("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>",
  { silent = true, desc = "Switch to window below" })
vim.keymap.set("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>",
  { silent = true, desc = "Switch to window above" })
vim.keymap.set("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>",
  { silent = true, desc = "Switch to window to the right" })
vim.keymap.set("n", "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>",
  { silent = true, desc = "Switch to previous window" })

-- Terminal-mode navigation
vim.keymap.set("t", "<c-h>", "<c-\\><c-n>:TmuxNavigateLeft<cr>",
  { silent = true, desc = "Switch to window to the left" })
vim.keymap.set("t", "<c-j>", "<c-\\><c-n>:TmuxNavigateDown<cr>",
  { silent = true, desc = "Switch to window below" })
vim.keymap.set("t", "<c-k>", "<c-\\><c-n>:TmuxNavigateUp<cr>",
  { silent = true, desc = "Switch to window above" })
vim.keymap.set("t", "<c-l>", "<c-\\><c-n>:TmuxNavigateRight<cr>",
  { silent = true, desc = "Switch to window to the right" })
vim.keymap.set("t", "<c-\\>", "<c-\\><c-n>:TmuxNavigatePrevious<cr>",
  { silent = true, desc = "Switch to previous window" })
