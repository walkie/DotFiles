" Set the <Leader> key
let mapleader = ','

" Insert a blank line from normal mode
noremap <S-RETURN> ^i<RETURN><ESC>

" Make window switching easier
noremap <S-J> <C-W>j
noremap <S-K> <C-W>k
noremap <S-H> <C-W>h
noremap <S-L> <C-W>l

" Make Y copy to the end of the line
noremap <S-Y> y$

" Make the arrow keys move up and down *visible* lines
" i.e. they work slightly different than j and k, but this is often useful
map <Up> gk
map <Down> gj
inoremap <Up> <C-O>gk
inoremap <Down> <C-O>gj

" Make space and backspace more useful
" nnoremap <Space> 30j
" nnoremap <Backspace> 30k
