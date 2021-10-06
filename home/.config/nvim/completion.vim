" Configure tab-completion

" Improve completion experience (:help completeopt)
"  * menuone: popup even when there's only one match
"  * longest: only insert the longest common text of the matches
set completeopt=menuone,longest

" Avoid showing extra messages when using completion
set shortmess+=c

" Make the 'longest' setting work with additional incremental text
let g:SuperTabLongestEnhanced = 1

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
" imap <C-Space> <C-R>=SuperTabAlternateCompletion('<C-X><C-O>')<CR>
