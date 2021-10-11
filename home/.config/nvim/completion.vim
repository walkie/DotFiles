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

" Following works for a while then randomly breaks for unknown reasons...
" decided to just manually trigger omni-completion for now :-(

" SuperTab can't directly call an omnifunc prefixed by 'v:lua', so wrap it
" function! OmniWrapper(findstart, base)
"   call &omnifunc(a:findstart, a:base)
" endfunction

" If contextual mapping doesn't trigger, try to do omni-completion;
" if that fails, fall back on vim's built-in reverse keyword completion
" autocmd FileType *
"   \ if &omnifunc != '' |
"   \   call SuperTabChain(&OmniWrapper, "<c-p>") |
"   \ endif

" Shortcut to force use of omni-completion
inoremap <C-Space> <C-R>=SuperTabAlternateCompletion("\<lt>C-X>\<lt>C-O>")<CR>
