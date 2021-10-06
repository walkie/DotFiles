" See: https://sharksforarms.dev/posts/neovim-rust/

" Configure LSP
" https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#hls
" https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
lua <<EOF

-- nvim_lsp object
local nvim_lsp = require'lspconfig'

-- Callback that attaches completion and performs buffer-specific configuration
local on_attach = function(client, buffer)
  -- require'completion'.on_attach(client)
  vim.cmd('source $VIMCONFIG/lsp-buffer.vim')
end

-- Enable haskell-language-server
nvim_lsp.hls.setup({ on_attach=on_attach })

-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    severity_sort = true,
    signs = true,
    underline = false,
    update_in_insert = false,
    virtual_text = false,
  }
)
EOF

" Configure sign characters for diagnostics
sign define LspDiagnosticsSignError       text=e
sign define LspDiagnosticsSignWarning     text=w
sign define LspDiagnosticsSignInformation text=i
sign define LspDiagnosticsSignHint        text=h
