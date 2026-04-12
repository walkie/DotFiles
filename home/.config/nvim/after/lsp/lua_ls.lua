return {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
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
      client:notify("workspace/didChangeConfiguration", { settings = client.settings })
    end
  end,
}
