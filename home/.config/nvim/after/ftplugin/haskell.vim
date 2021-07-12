" start new lines at the same indent level as the previous
set autoindent

" tell vim about Haskell comments and pragmas
setlocal comments=f:{-#,s1fl:{-,mb:\ \ ,ex:-},:-- commentstring=--\ %s

" auto-wrap long comments and auto-insert comment leaders
setlocal formatoptions=croql
setlocal textwidth=79

" keyboard shortcuts for ghcmod-vim
nmap <LocalLeader>t :GhcModType<CR>
nmap <LocalLeader>T :GhcModTypeClear<CR>
nmap <LocalLeader>c :GhcModCheck<CR>
nmap <LocalLeader>l :GhcModLint<CR>

" omni auto-completion via necoghc and ghc-mod
" setlocal omnifunc=necoghc#omnifunc
