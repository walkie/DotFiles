" See: https://sharksforarms.dev/posts/neovim-rust/

" Improve completion experience (:help completeopt)
"  * menuone: popup even when there's only one match
"  * noinsert: do not insert text until a selection is made
"  * noselect: do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Configure LSP
" https://github.com/neovim/nvim-lspconfig#rust_analyzer
lua <<EOF

-- nvim_lsp object
local nvim_lsp = require'lspconfig'

-- Callback that attaches completion and performs buffer-specific configuration
local on_attach = function(client, buffer)
  require'completion'.on_attach(client)
  vim.cmd('source $VIMCONFIG/lsp-buffer.vim')
end

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
