-- Configuration to add in an LSP buffer only

local km = vim.keymap

-- Set omni-completion function
vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

-- Have a fixed column for the diagnostics to appear in
vim.opt_local.signcolumn = "yes"

-- Floating info
km.set("n", "H", "<cmd>lua vim.lsp.buf.hover()<cr>",
  { buffer = true, desc = "Show hover information" })
km.set("n", "<leader>\\", "<cmd>lua vim.diagnostic.open_float()<cr>",
  { buffer = true, desc = "Show line diagnostics" })
-- km.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>",
--   { buffer = true, desc = "Show signature help" })

-- Navigation
km.set("n", "<leader>t", "<cmd>lua vim.lsp.buf.type_definition()<cr>",
  { buffer = true, desc = "Go to type definition" })
km.set("n", "<leader>d", "<cmd>lua vim.lsp.buf.definition()<cr>",
  { buffer = true, desc = "Go to symbol definition" })
km.set("n", "<leader>[", "<cmd>lua vim.diagnostic.goto_prev()<cr>",
  { buffer = true, desc = "Go to previous diagnostic entry" })
km.set("n", "<leader>]", "<cmd>lua vim.diagnostic.goto_next()<cr>",
  { buffer = true, desc = "Go to next diagnostic entry" })

-- Quickfix info under cursor
km.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.references()<cr>",
  { buffer = true, desc = "Show references to symbol under cursor" })
km.set("n", "<leader>i", "<cmd>lua vim.lsp.buf.implementation()<cr>",
  { buffer = true, desc = "Show implementations of symbol under cursor" })
km.set("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>",
  { buffer = true, desc = "Select code action at cursor" })

-- Quickfix info not based on cursor
km.set("n", "<leader>s", "<cmd>lua vim.lsp.buf.document_symbol()<cr>",
  { buffer = true, desc = "Show all symbols in current buffer" })
km.set("n", "<leader>S", "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>",
  { buffer = true, desc = "Query for symbol in workspace" })
