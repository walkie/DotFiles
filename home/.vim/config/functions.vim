" Turn on plain text options
function! PlainText()

  " Turn on text wrapping
  setlocal textwidth=79
  setlocal formatoptions+=t

  " Turn on spell checking
  setlocal spell
  highlight SpellBad ctermfg=DarkRed
  highlight SpellBad ctermbg=Black
  highlight SpellBad guisp=Red
  highlight SpellCap ctermfg=DarkGreen
  highlight SpellCap ctermbg=Black
  highlight SpellCap guisp=Green

  " Commands to reformat paragraphs
  nmap F mF{gq}`F
  nmap <Leader>F mF{jvipJ`F

  " Use one space after periods on reformat
  setlocal nojoinspaces

endfunction

" Override some options in PlainText()
" to get soft rather than hard wrapping
function! SoftWrap()
  setlocal textwidth=0  " turn off hard text wrapping
  setlocal wrap         " turn on soft text wrapping
  setlocal linebreak    " don't break in the middle of words
  setlocal nolist       " list disables linebreak
endfunction

" Maximize the window of the GUI
function! Maximize()
  if has("gui_macvim")
    set lines=999 columns=9999
  endif
endfunction

" Set up the visual style of the GUI for regular editing.
function! NormalStyle()
  if has("gui_running")
    if has ("gui_macvim")
      set transparency=10
      set guifont=Liberation_Mono:h12
    elseif has('win32') || has('win64')
      set guifont=Consolas:h11
    else
      set guifont=Liberation\ Mono\ Bold\ 14
    endif
    colorscheme torte
    highlight clear Search
    highlight Search guibg=gray35
  endif
  let g:airline_theme='wombat'  " other decent ones: badcat, monochrome
endfunction

" Set up the visual style of the GUI for presentations.
function! PresentationStyle()
  if has("gui_running")
    if has("gui_macvim")
      set transparency=0
      set guifont=Liberation_Mono:h24
    elseif has('win32') || has('win64')
      set guifont=Consolas:h20
    else
      set guifont=Liberation\ Mono\ 24
    endif
    colorscheme default
    colorscheme default " bug requires loading default scheme twice
    " hide tildes at end of file
    highlight NonText guifg=bg
  endif
  let g:airline_theme='aurora'
endfunction

" Latex-style mappings for common mathematical characters
function! SymbolMacros()
  imap <buffer> \forall ∀
  imap <buffer> \exists ∃
  imap <buffer> \notexists ∄
  imap <buffer> \in ∈
  imap <buffer> \notin ∉
  imap <buffer> \epsilon ε
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

" Install Taskwarrior Python bindings (arg comes from VimPlug)
" function! InstallTasklib(info)
"   if has("unix")
"     " Only execute when first installing or on force update
"     if a:info.status == 'installed' || a:info.force
"       !{ type -p pip && pip install --upgrade git+git://github.com/tbabej/tasklib@develop; } ||
"         \ { type -p pip2 && pip2 install --upgrade git+git://github.com/tbabej/tasklib@develop; } ||
"         \ echo 'Install pip then run :PlugInstall! taskwiki'
"     endif
"   endif
" endfunction
