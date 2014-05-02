" add syntax highlight for tilde-delimited code blocks
syn region markdownCode matchgroup=markdownCodeDelimiter start="^\s*\~\~\~.*$" end="^\s*\~\~\~\ze\s*$" keepend
