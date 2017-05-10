" syn clear texParen
" if !exists("g:tex_nospell") || !g:tex_nospell
"   syn region texParen start="(" end=")\|%stopzone\>" oneline contains=@texMatchGroup,@Spell
" else
"   syn region texParen start="(" end=")\|%stopzone\>" oneline contains=@texMatchGroup
" endif

" Treat \lstinline similar to \verb
" Yoinked from: https://github.com/lervag/vimtex/blob/master/after/syntax/tex.vim
syntax region texZone
      \ start="\\begin{lstlisting}"rs=s
      \ end="\\end{lstlisting}\|%stopzone\>"re=e
      \ keepend
      \ contains=texBeginEnd
syntax match texInputFile
      \ "\\lstinputlisting\s*\(\[.*\]\)\={.\{-}}"
      \ contains=texStatement,texInputCurlies,texInputFileOpt
syntax match texZone "\\lstinline\s*\(\[.*\]\)\={.\{-}}"
