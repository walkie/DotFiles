-- Easier LSP configuration:
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

require("walkie/lsp").setup()
vim.lsp.enable("lua_ls")
vim.lsp.enable("rust_analyzer")
