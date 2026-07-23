" start new lines at the same indent level as the previous
setlocal autoindent

" tell vim about Haskell comments and pragmas
setlocal comments=f:{-#,s1fl:{-,mb:\ \ ,ex:-},:-- commentstring=--\ %s

" auto-wrap long comments and auto-insert comment leaders
setlocal formatoptions=croql
setlocal textwidth=79

" omni auto-completion via necoghc and ghc-mod
" setlocal omnifunc=necoghc#omnifunc
