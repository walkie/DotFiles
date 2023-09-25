-- Easier LSP configuration:
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

local lspconfig = require("lspconfig")

-- Configuration to apply to every LSP-powered buffer
function lsp_buffer(client, buffer)

  local function km(lhs, rhs, desc)
    vim.keymap.set("n", lhs, rhs,
      { buffer = true, noremap = true, silent = true, desc = desc })
  end

  -- Set omni-completion function
  vim.bo[buffer].omnifunc = "v:lua.vim.lsp.omnifunc"

  -- Floating info
  km("H", vim.lsp.buf.hover, "Show hover information")
  km("<leader>\\", vim.diagnostic.open_float, "Show line diagnostics")
  -- km("<C-k>", vim.lsp.buf.signature_help, "Show signature help")

  -- Navigation
  km("<leader>t", vim.lsp.buf.type_definition, "Go to type definition")
  km("<leader>d", vim.lsp.buf.definition, "Go to symbol definition")
  km("<leader>[", vim.diagnostic.goto_prev, "Go to previous diagnostic entry")
  km("<leader>]", vim.diagnostic.goto_next, "Go to next diagnostic entry")

  -- Quickfix info under cursor
  km("<leader>r", vim.lsp.buf.references, "Show references to symbol under cursor")
  km("<leader>i", vim.lsp.buf.implementation, "Show implementations of symbol under cursor")
  km("<leader>a", vim.lsp.buf.code_action, "Select code action at cursor")

  -- Quickfix info not based on cursor
  km("<leader>s", vim.lsp.buf.document_symbol, "Show all symbols in current buffer")
  km("<leader>S", vim.lsp.buf.workspace_symbol, "Query for symbol in workspace")
end

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

-- Configure sign characters for diagnostics
vim.cmd([[
  sign define DiagnosticSignError text=e texthl=DiagnosticSignError
  sign define DiagnosticSignWarn  text=w texthl=DiagnosticSignWarn
  sign define DiagnosticSignInfo  text=i texthl=DiagnosticSignInfo
  sign define DiagnosticSignHint  text=h texthl=DiagnosticSignHint
]])


-- ** Haskell **

-- Enable haskell-language-server
lspconfig.hls.setup({
  on_attach = lsp_buffer,
})


-- ** Lua **

-- Enable lua-language-server
lspconfig.lua_ls.setup({
  on_attach = lsp_buffer,

  -- Adapted from: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path.."/.luarc.json") and not vim.loop.fs_stat(path.."/.luarc.jsonc") then
      client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
        Lua = {
          runtime = { version = "LuaJIT" },
          workspace = {
            checkThirdParty = false,
            library = vim.api.nvim_get_runtime_file("", true)
          }
        }
      })
      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end
})


-- ** Rust **

-- Extend system path to include `rust-analyzer`:
local rust_analyzer_exec = vim.fn.system("rustup which rust-analyzer")
if vim.v.shell_error == 0 then
  local rust_analyzer_path = vim.fn.substitute(rust_analyzer_exec, "/rust-analyzer\n", "", "")
  vim.env.PATH = rust_analyzer_path .. ":" .. vim.env.PATH
end

-- Config for rust_analyzer
local rust_analyzer_config = {
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy" -- default: "check"
      },
      cmd_env = {
        RA_LOG = "error" -- try to disable annoying "long loop" warnings
      }
    }
  },
  on_attach = function(client, buffer)
    -- Disable busy/inconsistent coloring
    client.server_capabilities.semanticTokensProvider = nil
    -- Apply buffer-specific config
    lsp_buffer(client, buffer)
  end
}

-- Config for rust-tools plugin
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

require("rust-tools").setup(rust_tools_config)

-- This step is done by rust-tools
-- lspconfig.rust_analyzer.setup(rust_analyzer_config)
