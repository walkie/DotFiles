local rust_analyzer = vim.fn.exepath("rust-analyzer")
if rust_analyzer == "" then
  local result = vim.system({ "rustup", "which", "rust-analyzer" }, { text = true }):wait()
  if result.code == 0 then
    local from_rustup = vim.trim(result.stdout or "")
    if from_rustup ~= "" then
      rust_analyzer = from_rustup
    end
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
