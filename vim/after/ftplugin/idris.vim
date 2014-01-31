" start new lines at the same indent level as the previous
setlocal autoindent   

" idris-vim's indent is broken
setlocal indentexpr=

" tell vim about Idris-style comments
setlocal comments=s1fl:{-,mb:-,ex:-},:--

" auto-wrap comments and auto-insert comment leaders
setlocal formatoptions=croql
