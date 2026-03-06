-- Easier LSP configuration:
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

require("walkie/lsp").setup()


-- ** Haskell **

-- Enable haskell-language-server
-- lspconfig.hls.setup({
--   on_attach = lsp_buffer,
-- })


-- ** Lua **

-- Neovim 0.11+ uses `vim.lsp.config()` / `vim.lsp.enable()` (see `:help lspconfig-nvim-0.11`).
-- `nvim-lspconfig` now provides server defaults via `lsp/*.lua` runtime files.
if not vim.lsp.config.lua_ls then
  vim.lsp.config.lua_ls = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
  }
end

vim.lsp.config("lua_ls", {
  on_init = function(client)
    local root = client.root_dir
    if not root or root == "" then
      return
    end

    if not vim.uv.fs_stat(root .. "/.luarc.json") and not vim.uv.fs_stat(root .. "/.luarc.jsonc") then
      client.settings = vim.tbl_deep_extend("force", client.settings or {}, {
        Lua = {
          runtime = { version = "LuaJIT" },
          workspace = {
            checkThirdParty = false,
            library = vim.api.nvim_get_runtime_file("", true),
          },
        },
      })
      client.notify("workspace/didChangeConfiguration", { settings = client.settings })
    end
  end,
})

vim.lsp.enable("lua_ls")


-- ** Rust **

local rust_analyzer = vim.fn.exepath("rust-analyzer")
if rust_analyzer == "" then
  local from_rustup = vim.fn.systemlist({ "rustup", "which", "rust-analyzer" })[1]
  if from_rustup and from_rustup ~= "" then
    rust_analyzer = from_rustup
  end
end

vim.lsp.config("rust_analyzer", {
  cmd = { rust_analyzer ~= "" and rust_analyzer or "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml", ".git" },
  cmd_env = {
    RA_LOG = "warn",
  },
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = true,
      check = {
        command = "clippy",
      },
      inlayHints = {
        parameterHints = {
          enable = false,
        },
      },
    },
  },
  -- LSP attach behavior (keymaps, inlay hints, etc.) is handled via `LspAttach`
  -- in `walkie/lsp.lua`.
})

vim.lsp.enable("rust_analyzer")


-- ** Ott **

-- Install: https://github.com/SergioBenitez/ott-lsp
-- configs.ott_lsp = {
--     default_config = {
--         cmd = { 'ott-lsp' },
--         filetypes = { 'ott' },
--         root_dir = function()
--             return vim.fn.getcwd()
--         end,
--         single_file_support = true,
--     },
-- }
-- configs.ott_lsp.setup()
