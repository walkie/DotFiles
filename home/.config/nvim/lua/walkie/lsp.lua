local M = {}

local did_setup = false

function M.setup()
  if did_setup then
    return
  end
  did_setup = true

  vim.diagnostic.config({
    float = {
      border = "rounded",
      focusable = false,
      header = "",
    },
    severity_sort = true,
    signs = true,
    underline = false,
    virtual_text = false,
  })

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] =
    vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

  vim.cmd([[
    sign define DiagnosticSignError text=e texthl=DiagnosticSignError
    sign define DiagnosticSignWarn  text=w texthl=DiagnosticSignWarn
    sign define DiagnosticSignInfo  text=i texthl=DiagnosticSignInfo
    sign define DiagnosticSignHint  text=h texthl=DiagnosticSignHint
  ]])

  local group = vim.api.nvim_create_augroup("walkie-lsp", { clear = true })
  vim.api.nvim_create_autocmd("LspAttach", {
    group = group,
    callback = function(args)
      local bufnr = args.buf

      local function km(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, {
          buffer = bufnr,
          noremap = true,
          silent = true,
          desc = desc,
        })
      end

      -- Prefer Neovim 0.11+ built-in LSP keymaps (see `:help lsp-defaults`).
      -- Keep a minimal set of add-ons that follow common conventions.
      km("gd", vim.lsp.buf.definition, "Go to definition")
      km("gD", vim.lsp.buf.declaration, "Go to declaration")
      km("gl", vim.diagnostic.open_float, "Show line diagnostics")
      km("[d", vim.diagnostic.goto_prev, "Go to previous diagnostic entry")
      km("]d", vim.diagnostic.goto_next, "Go to next diagnostic entry")
      km("<leader>S", vim.lsp.buf.workspace_symbol, "Workspace symbol search")

      local client = args.data and vim.lsp.get_client_by_id(args.data.client_id) or nil
      if
        client
        and vim.bo[bufnr].filetype == "rust"
        and client:supports_method("textDocument/inlayHint", bufnr)
      then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        km("<leader>uh", function()
          local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
          vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
        end, "Toggle inlay hints")
      end
    end,
  })
end

return M
