-- Config for buffer explorer plugin

-- Open buffer explorer with B in normal mode
function add_keymap ()
  vim.keymap.set("n", "B", "<cmd>ToggleBufExplorer<cr>",
    { desc = "Open buffer explorer" })
end
add_keymap()

-- Use relative paths by default
vim.g.bufExplorerShowRelativePath = 1

-- Add an autocmd to re-add the keymap in the BufExplorer window. Need to do
-- this since the plugin adds a clashing keybinding on each load.
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "[BufExplorer]",
  callback = add_keymap
})
