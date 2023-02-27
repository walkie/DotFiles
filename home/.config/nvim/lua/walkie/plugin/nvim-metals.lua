local config = require("metals").bare_config()

config.settings = {
  showImplicitArguments = true
}

-- Figure out how to add this to my status line
-- config.init_options.statusBarProvider = "on"

-- Callback that performs LSP-buffer-specific configuration
config.on_attach = function(client, buffer)
  require("walkie/lsp-buffer")
  -- require("metals").setup_dap()
end

-- Add an autocmd that will start/attach metals
local metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach(config)
  end,
  group = metals_group,
})
