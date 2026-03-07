local ok, wk = pcall(require, "which-key")
if not ok then
  return
end

wk.setup({})

wk.add({
  { "<leader><space>", desc = "Clear search highlighting" },
  { "<leader>S", desc = "Workspace symbol search (LSP)" },
  { "<leader>f", group = "Find" },
})

local group = vim.api.nvim_create_augroup("walkie-which-key", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "coq",
  callback = function(args)
    wk.add({
      { "<leader>c", group = "Coqtail" },
      { "<leader>cc", desc = "Start (RocqStart)" },
      { "<leader>cq", desc = "Stop (RocqStop)" },
      { "<leader>ci", desc = "Interrupt" },
      { "<leader>cj", desc = "Next sentence" },
      { "<leader>ck", desc = "Undo sentence" },
      { "<leader>cl", desc = "To cursor/line (RocqToLine)" },
      { "<leader>c<CR>", desc = "To cursor/line (RocqToLine)" },
      { "<leader>cT", desc = "To top" },
      { "<leader>cG", desc = "Jump to end of checked region" },
      { "<leader>cE", desc = "Jump to error" },
      { "<leader>cgd", desc = "Goto definition" },
      { "<leader>cs", desc = "Search" },
    }, { buffer = args.buf })
  end,
})
