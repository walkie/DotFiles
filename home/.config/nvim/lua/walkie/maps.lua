local km = vim.keymap

-- Set the <Leader> and <LocalLeader> keys
vim.g.mapleader = "\\"
vim.g.maplocalleader = "-"

-- Emacs-style line movement
km.set({"n", "i", "c"}, "<c-a>", "<home>",
  { desc = "Move cursor to start of line" })
km.set({"n", "i"}, "<c-e>", "<end>",
  { desc = "Move cursor to end of line" })

-- Move relative to visual lines when wrapped
km.set("n", "0", "g0", { desc = "Move to start of visual line" })
km.set("n", "$", "g$", { desc = "Move to end of visual line" })
km.set("n", "j", "gj", { desc = "Move to next visual line" })
km.set("n", "k", "gk", { desc = "Move to previous visual line" })
km.set("n", "<down>", "gj", { desc = "Move to next visual line" })
km.set("n", "<up>",   "gk", { desc = "Move to previous visual line" })
km.set("i", "<down>", "<c-o>gj", { desc = "Move to next visual line" })
km.set("i", "<up>",   "<c-o>gk", { desc = "Move to previous visual line" })

-- Using vim-tmux-navigator plugin to replace these:
-- -- Make window switching easier
-- km.set("n", "<c-h>", "<c-w>h", { desc = "Switch to window to the left" })
-- km.set("n", "<c-j>", "<c-w>j", { desc = "Switch to window below" })
-- km.set("n", "<c-k>", "<c-w>k", { desc = "Switch to window above" })
-- km.set("n", "<c-l>", "<c-w>l", { desc = "Switch to window to the right" })
-- km.set("t", "<c-h>", "<c-\\><c-n><c-w>h", { desc = "Switch to window to the left" })
-- km.set("t", "<c-j>", "<c-\\><c-n><c-w>j", { desc = "Switch to window below" })
-- km.set("t", "<c-k>", "<c-\\><c-n><c-w>k", { desc = "Switch to window above" })
-- km.set("t", "<c-l>", "<c-\\><c-n><c-w>l", { desc = "Switch to window to the right" })

-- Copying
km.set("n", "Y", "y$",
  { desc = "Copy to the end of the line" })
km.set("v", "<c-c>", "+y",
  { desc = "Copy selection to system clipboard" })

-- Misc
km.set("n", "<c-space>", "^i<return><esc>",
  { desc = "Insert a blank line" })
km.set("n", "<space>", ":nohlsearch<bar>:echo<cr>",
  { desc = "Clear search highlighting", silent = true})
km.set("t", "<esc>", "<c-\\><c-n>",
  { desc = "Exit insert mode in embedded in terminal" })
