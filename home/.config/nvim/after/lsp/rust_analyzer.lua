local rust_analyzer = vim.fn.exepath("rust-analyzer")
if rust_analyzer == "" then
  local from_rustup = vim.fn.systemlist({ "rustup", "which", "rust-analyzer" })[1]
  if from_rustup and from_rustup ~= "" then
    rust_analyzer = from_rustup
  end
end

return {
  cmd = { rust_analyzer ~= "" and rust_analyzer or "rust-analyzer" },
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
}
