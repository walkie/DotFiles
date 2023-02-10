" Turn on plain text options
function! PlainText()

  " Turn on text wrapping
  setlocal textwidth=79
  setlocal formatoptions+=t

  " Turn on spell checking
  setlocal spell
  highlight SpellBad ctermbg=Black ctermfg=DarkRed guisp=Red
  highlight SpellCap ctermbg=Black ctermfg=DarkGreen guisp=Green

  " Commands to reformat paragraphs
  nmap F mF{gq}`F
  nmap <Leader>F mF{jvipJ`F

  " Use one space after periods on reformat
  setlocal nojoinspaces

endfunction


" Reload the spell files, if needed
function! ReloadSpellFiles()
  for f in glob("$SPELLDIR/*.add", 1, 1)
    if !filereadable(f . '.spl') || getftime(f) > getftime(f . '.spl')
      exec 'silent mkspell! ' . fnameescape(f)
    endif
  endfor
endfunction


" Override some options in PlainText() to get soft wrapping
function! SoftWrap()
  setlocal textwidth=0  " turn off hard text wrapping
  setlocal wrap         " turn on soft text wrapping
  setlocal linebreak    " don't break in the middle of words
  setlocal nolist       " list disables linebreak
endfunction


" Unwrap a hard-wrapped file
function! Unwrap()
  execute 'g/\(\%1l\|^\s*\n.*\S.*$\)/+norm vipJ'
endfunction


" Paste from the system clipboard at the current insert-mode cursor position
function! InsertClipboardPaste()
  if col('.') == col('$')-1
    execute 'normal! "+gp'
  else
    execute 'normal! "+gP'
  endif
endfunction


" Set visual style for normal use, typically in my "Dark" terminal profile
function! NormalStyle()

  " set color scheme
  colorscheme torte
  set background=dark
  highlight Normal guibg=NONE

  " tweak colors
  highlight clear ExtraWhitespace
  highlight CursorLine          guibg=gray20
  highlight ExtraWhitespace     guibg=gray30 guifg=NONE
  highlight NonText             guifg=gray30

  " search colors
  highlight clear Search
  highlight clear IncSearch
  highlight IncSearch           gui=reverse
  highlight Search              guibg=gray40 guifg=NONE
  highlight CurSearch           guibg=gray50 guifg=NONE
  highlight Visual              guibg=gray50 guifg=NONE

  " floating menus
  highlight FloatBorder         guibg=gray20 guifg=gray50
  highlight NormalFloat         guibg=gray20
  highlight Pmenu               guibg=gray20
  highlight PmenuSel            guibg=gray30 guifg=0

  " sign column
  highlight SignColumn          guibg=NONE
  highlight DiagnosticSignError guifg=tomato
  highlight DiagnosticSignWarn  guifg=orange
  highlight DiagnosticSignInfo  guifg=DeepSkyBlue
  highlight DiagnosticSignHint  guifg=LawnGreen
  highlight SignifySignAdd      guibg=NONE guifg=ForestGreen
  highlight SignifySignChange   guibg=NONE guifg=ForestGreen
  highlight SignifySignDelete   guibg=NONE guifg=SaddleBrown

  " pop-up file tree
  if has('nvim')
    highlight NvimTreeExecFile   guifg=tomato gui=NONE
    highlight NvimTreeGitDirty   guifg=orange
    highlight NvimTreeGitRenamed guifg=orange
    highlight NvimTreeGitStaged  guifg=ForestGreen
    highlight NvimTreeGitNew     guifg=DeepSkyBlue
  endif

  if has('gui_running')

    " set font in GUI
    if has('gui_macvim')
      set transparency=10
      set guifont=Liberation_Mono:h12
    elseif has('win32') || has('win64')
      set guifont=Consolas:h11
    else
      set guifont=Liberation\ Mono\ Bold\ 14
    endif

  else

  " fix terminal colors
  let g:terminal_color_4 = '#80a0ff'

  endif

endfunction


" Set visual style for presentations
function! PresentationStyle()

  " set color scheme
  colorscheme default
  set background=light

  " less obtrusive end of file markers
  highlight NonText guifg=gray80

  " tweak colors
  highlight clear ExtraWhitespace
  highlight clear Search
  highlight ExtraWhitespace guibg=gray85
  highlight Search guibg=gray75
  highlight SignColumn      guibg=NONE

  highlight FloatBorder     guibg=gray90
  highlight NormalFloat     guibg=gray90
  highlight Pmenu           guibg=gray90
  highlight PmenuSel        guibg=gray75

  highlight DiagnosticSignError guifg=tomato
  highlight DiagnosticSignWarn  guifg=orange
  highlight DiagnosticSignInfo  guifg=DeepSkyBlue
  highlight DiagnosticSignHint  guifg=LawnGreen

  if has('gui_running')

    "set font in GUI
    if has('gui_macvim')
      set transparency=0
      set guifont=Liberation_Mono:h24
    elseif has('win32') || has('win64')
      set guifont=Consolas:h20
    else
      set guifont=Liberation\ Mono\ 30
    endif

  else

  " fix terminal colors
  let g:terminal_color_2 = 'Green'
  let g:terminal_color_4 = 'Blue'

  endif

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
