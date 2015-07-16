" start new lines at the same indent level as the previous
set autoindent

" tell vim about Haskell comments and pragmas
setlocal comments=f:{-#,s1fl:{-,mb:-,ex:-},:-- commentstring=--\ %s

" auto-wrap long comments and auto-insert comment leaders
setlocal formatoptions=croql

" keyboard shortcuts for ghcmod-vim
nmap <Leader>t :GhcModType<CR>
nmap <Leader>T :GhcModTypeClear<CR>
nmap <Leader>c :GhcModCheck<CR>
nmap <Leader>l :GhcModLint<CR>

" omni auto-completion via necoghc and ghc-mod
setlocal omnifunc=necoghc#omnifunc
