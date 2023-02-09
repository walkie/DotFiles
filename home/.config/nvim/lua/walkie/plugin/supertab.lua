-- Config for the supertab completion plugin

-- Tweak completion options (:help completeopt)
--  * menu: use a popup menu
--  * menuone: popup even when there's only one match
--  * noselect: don't automatically select the first match
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Avoid showing extra messages when using completion
vim.opt.shortmess:append("c")

-- Tab indents if there's only whitespace preceding it
vim.g.SuperTabNoCompleteAfter = { "^\\s*" }

-- If preceding text looks like a filepath, use filepath completion
vim.g.SuperTabDefaultCompletionType = "context"

-- Shortcut to force use of omni-completion
vim.keymap.set("i", "<c-space>",
  "<c-r>=SuperTabAlternateCompletion(\"\\<lt>c-X>\\<lt>c-O>\")<cr>",
  { desc = "Trigger omni-completion" })
