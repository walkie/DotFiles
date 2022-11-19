" Configure LSP
" https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

" Extend system path to include `rust-analyzer`:
let rust_analyzer_exec = system('rustup which rust-analyzer')
if v:shell_error == 0
  let rust_analyzer_path = substitute(rust_analyzer_exec, '/rust-analyzer\n', '', '')
  let $PATH = rust_analyzer_path . ':' . $PATH
endif

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
local rust_analyzer_config = {
  on_attach = lsp_buffer_config,
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy" -- default: "check"
      },
      cmd_env = {
        RA_LOG = "error" -- try to disable annoying "long loop" warnings
      }
    }
  }
}

local rust_tools_config = {
  tools = {
    inlay_hints = {
      show_parameter_hints = false,
      highlight = "NonText",
    },
    hover_actions = { border = "rounded" }
  },
  server = rust_analyzer_config
}

require('rust-tools').setup(rust_tools_config)

-- This step is done by rust-tools
-- lspconfig.rust_analyzer.setup(rust_analyzer_config)

-- Configure diagnostics
vim.diagnostic.config({
  -- configure floating window
  float = {
    border = "rounded",
    focusable = false,
    header = ""
  },
  -- use signs rather than underline and floating text
  severity_sort = true,
  signs = true,
  underline = false,
  virtual_text = false,
})
EOF

" Configure sign characters for diagnostics
sign define DiagnosticSignError text=e texthl=DiagnosticSignError
sign define DiagnosticSignWarn  text=w texthl=DiagnosticSignWarn
sign define DiagnosticSignInfo  text=i texthl=DiagnosticSignInfo
sign define DiagnosticSignHint  text=h texthl=DiagnosticSignHint
