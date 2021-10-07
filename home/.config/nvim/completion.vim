" Configure tab-completion

" Tweak completion options (:help completeopt)
"  * menu: use a popup menu
"  * menuone: popup even when there's only one match
"  * noselect: don't automatically select the first match
set completeopt=menu,menuone,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Tab indents if there's only whitespace preceding it
let g:SuperTabNoCompleteAfter = ['^\s*']

" If preceding text looks like a filepath, use filepath completion
let g:SuperTabDefaultCompletionType = 'context'

" Otherwise, try to do omni-completion; if that fails, fall back on vim's
" built-in reverse keyword completion
autocmd FileType *
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<c-p>") |
  \ endif

" Shortcut to force use of omni-completion
imap <C-Space> <C-R>=SuperTabAlternateCompletion('<C-X><C-O>')<CR>
