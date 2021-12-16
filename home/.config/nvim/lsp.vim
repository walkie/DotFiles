" Configure LSP
" https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
lua <<EOF

local lspconfig = require('lspconfig')

-- Callback that performs buffer-specific configuration
local lsp_buffer_config = function(client, buffer)
  vim.cmd('source $VIMCONFIG/lsp-buffer.vim')
end

-- Enable haskell-language-server
lspconfig.hls.setup {
  on_attach = lsp_buffer_config,
}

-- Enable rust_analyzer
lspconfig.rust_analyzer.setup {
  on_attach = lsp_buffer_config,
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy"  -- default: "check"
      }
    }
  }
}

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    severity_sort = false,
    signs = true,
    underline = false,
    update_in_insert = false,
    virtual_text = false,
  }
)
EOF

  " Configure sign characters for diagnostics
sign define DiagnosticSignError text=e texthl=DiagnosticSignError
sign define DiagnosticSignWarn  text=w texthl=DiagnosticSignWarn
sign define DiagnosticSignInfo  text=i texthl=DiagnosticSignInfo
sign define DiagnosticSignHint  text=h texthl=DiagnosticSignHint
