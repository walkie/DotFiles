local M = {}

local did_setup = false

local function buffer_supports_inlay_hints(bufnr)
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
    if client:supports_method("textDocument/inlayHint", bufnr) then
      return true
    end
  end
  return false
end

function M.setup()
  if did_setup then
    return
  end
  did_setup = true

  vim.diagnostic.config({
    float = {
      focusable = false,
      header = "",
    },
    severity_sort = true,
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "e",
        [vim.diagnostic.severity.WARN] = "w",
        [vim.diagnostic.severity.INFO] = "i",
        [vim.diagnostic.severity.HINT] = "h",
      },
    },
    underline = false,
    virtual_text = false,
  })

  vim.api.nvim_create_user_command("Format", function()
    local bufnr = 0
    local clients = vim.lsp.get_clients({ bufnr = bufnr })
    if #clients == 0 then
      vim.notify("No LSP client attached to this buffer", vim.log.levels.WARN)
      return
    end
    vim.lsp.buf.format({ async = true })
  end, { desc = "Format current buffer via LSP" })

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
      km("<leader>S", vim.lsp.buf.workspace_symbol, "Workspace symbol search")
      km("[d", function()
        vim.diagnostic.jump({ count = -1 })
      end, "Go to previous diagnostic entry")
      km("]d", function()
        vim.diagnostic.jump({ count = 1 })
      end, "Go to next diagnostic entry")

      if not vim.b[bufnr].walkie_inlay_hint_map then
        vim.b[bufnr].walkie_inlay_hint_map = true
        km("<leader>uh", function()
          if not buffer_supports_inlay_hints(bufnr) then
            vim.notify("Inlay hints not supported for this buffer", vim.log.levels.WARN)
            return
          end
          local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
          vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
        end, "Toggle inlay hints")
      end

      if vim.bo[bufnr].filetype == "rust" and buffer_supports_inlay_hints(bufnr) then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      end
    end,
  })
end

return M
