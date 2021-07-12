" add syntax highlight for tilde-delimited code blocks
syn region markdownCode matchgroup=markdownCodeDelimiter start="^\s*\~\~\~.*$" end="^\s*\~\~\~\ze\s*$" keepend

" add ':' as list marker for definition lists
syn match markdownListMarker "\%(\t\| \{0,4\}\)[-*+:]\%(\s\+\S\)\@=" contained
setlocal formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^[-*+:]\\s\\+\\\|^\\[^\\ze[^\\]]\\+\\]:
