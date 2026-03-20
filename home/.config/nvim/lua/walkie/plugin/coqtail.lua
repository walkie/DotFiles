local M = {}

local function set_coqtail_highlights()
  -- The "checked" (compiled up to here) region is highlighted with CoqtailChecked.
  -- Use a slightly brighter green than Coqtail's default dark-mode highlight.
  vim.api.nvim_set_hl(0, "CoqtailChecked", { bg = "#1a4a1a", ctermbg = 22 })
end

function M.init()
  -- Prefer normal-mode mappings only: insert-mode mappings tend to be surprising while editing.
  vim.g.coqtail_noimap = 1

  -- Use `<localleader>` as prefix for Coqtail mappings instead of `<leader>c`
  vim.g.coqtail_map_prefix = "<localleader>"

  require("walkie/opam").setup({ auto = true, filetypes = { "coq" } })
  set_coqtail_highlights()

  local group = vim.api.nvim_create_augroup("walkie-coqtail-highlights", { clear = true })
  vim.api.nvim_create_autocmd("ColorScheme", {
    group = group,
    callback = set_coqtail_highlights,
  })

  -- Coqtail defines default keymaps, then calls `CoqtailHookDefineMappings()` if it exists.
  -- We use that hook to avoid hijacking `<C-c>` and provide a non-intrusive alternative.
  vim.cmd([[
    function! CoqtailHookDefineMappings() abort
      silent! nunmap <buffer> <C-c>
      silent! vunmap <buffer> <C-c>
      silent! iunmap <buffer> <C-c>
      nmap <buffer> <silent> <localleader>i <Plug>RocqInterrupt
      nmap <buffer> <silent> <localleader><CR> <Plug>RocqToLine
    endfunction
  ]])
end

return M
