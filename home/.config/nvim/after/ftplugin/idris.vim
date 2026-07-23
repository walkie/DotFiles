" tell vim about Idris-style comments
setlocal comments=s1fl:{-,mb:-,ex:-},:--
setlocal commentstring=--\ %s

" disable folding
setlocal nofoldenable

" auto-wrap comments and auto-insert comment leaders
setlocal formatoptions=croql
