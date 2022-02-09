" See: https://sharksforarms.dev/posts/neovim-rust/

" Configuration to add in an LSP buffer only

" Set omni-completion function
setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Show hover information
nnoremap <buffer> <silent> H <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <buffer> <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>

" Go to type/symbol defintion
nnoremap <buffer> <silent> <Leader>t <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <buffer> <silent> <Leader>d <cmd>lua vim.lsp.buf.definition()<CR>

" Show line diagnostics
nnoremap <buffer> <silent> <Leader><Leader> <cmd>lua vim.diagnostic.open_float()<CR>

" Go to previous/next diagnostic warning/error
nnoremap <buffer> <silent> <Leader>[ <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <buffer> <silent> <Leader>] <cmd>lua vim.diagnostic.goto_next()<CR>

" Show all references/implementations (quickfix)
nnoremap <buffer> <silent> <Leader>r <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <buffer> <silent> <Leader>i <cmd>lua vim.lsp.buf.implementation()<CR>

" Show all symbols in file/workspace (quickfix)
nnoremap <buffer> <silent> <Leader>s <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <buffer> <silent> <Leader>S <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

" Show list of code actions (quickfix)
nnoremap <buffer> <silent> <Leader>a <cmd>lua vim.lsp.buf.code_action()<CR>

" Have a fixed column for the diagnostics to appear in
setlocal signcolumn=yes

" Enable type inlay hints
" autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost <buffer>
"   \ lua require'lsp_extensions'.inlay_hints{
"   \   prefix = '',
"   \   highlight = "Comment",
"   \   enabled = {"TypeHint", "ChainingHint", "ParameterHint"}
"   \ }
