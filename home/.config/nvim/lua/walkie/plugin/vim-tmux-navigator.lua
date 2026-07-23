local function navigate_left()
  local ok, Snacks = pcall(require, "snacks")
  local picker = ok and Snacks.picker.get({ source = "buffers" })[1] or nil
  if
    picker
    and picker.preview.win:valid()
    and vim.api.nvim_get_current_win() == picker.preview.win.win
  then
    picker:focus("list")
    return
  end
  vim.cmd("TmuxNavigateLeft")
end

-- Normal-mode navigation
vim.keymap.set("n", "<c-h>", navigate_left,
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
