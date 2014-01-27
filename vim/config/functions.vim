" Turn on plain text options
function PlainText()
  " Turn on text wrapping
  setlocal textwidth=79
  " Turn on spell checking
  setlocal spell
  highlight SpellBad ctermfg=DarkRed
  highlight SpellBad ctermbg=Black
  highlight SpellBad guisp=Red
  highlight SpellCap ctermfg=DarkGreen
  highlight SpellCap ctermbg=Black
  highlight SpellCap guisp=Green
  " Command to reformat a paragraph
  nmap F {gq}k
  " Use one space after periods on reformat
  setlocal nojoinspaces
endfunction

" Override some options in PlainText()
" to get soft rather than hard wrapping
function SoftWrap()
  setlocal textwidth=0  " turn off hard text wrapping
  setlocal wrap         " turn on soft text wrapping
  setlocal linebreak    " don't break in the middle of words
  setlocal nolist       " list disables linebreak
endfunction

" Latex-style mappings for common mathematical characters
function SymbolMacros()
  imap <buffer> \forall ∀
  imap <buffer> \exists ∃
  imap <buffer> \notexists ∄
  imap <buffer> \in ∈
  imap <buffer> \notin ∉
  imap <buffer> \Lambda Λ
  imap <buffer> \lambda λ
  imap <buffer> \mu µ
  imap <buffer> \Sigma Σ
  imap <buffer> \Pi ∏
  imap <buffer> \Gamma Γ
  imap <buffer> \gamma γ
  imap <buffer> \to →
  imap <buffer> \equiv ≡
  imap <buffer> \bot ⊥
  imap <buffer> \oplus ⊕
  imap <buffer> \otimes ⊗
endfunction
