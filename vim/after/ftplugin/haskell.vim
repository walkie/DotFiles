" start new lines at the same indent level as the previous
set autoindent

" fix so we don't auto-insert '-' in language pragmas
setlocal comments=f:{-#,s1fl:{-,mb:-,ex:-},:--

" add highlighting of 'family' keyword
syn clear hsTypedef
syn match hsTypedef "\<\(type\|newtype\|family\)\>"

" keyboard shortcuts for ghcmod-vim
nmap ,t :GhcModType<CR>
nmap ,T :GhcModTypeClear<CR>
nmap ,c :GhcModCheck<CR>
nmap ,l :GhcModLint<CR>
