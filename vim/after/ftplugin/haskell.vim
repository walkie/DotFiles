" start new lines at the same indent level as the previous
set autoindent

" fix so we don't auto-insert '-' in language pragmas
setlocal comments=f:{-#,s1fl:{-,mb:-,ex:-},:--

" keyboard shortcuts for ghcmod-vim
nmap ,t :GhcModType<CR>
nmap ,T :GhcModTypeClear<CR>
nmap ,c :GhcModCheck<CR>
nmap ,l :GhcModLint<CR>
