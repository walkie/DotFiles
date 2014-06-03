" Set the <Leader> key
let mapleader = ','

" Insert a blank line from normal mode
nnoremap <S-RETURN> ^i<RETURN><ESC>

" Make window switching easier
nnoremap <S-J> <C-W>j
nnoremap <S-K> <C-W>k
nnoremap <S-H> <C-W>h
nnoremap <S-L> <C-W>l

" Make Y copy to the end of the line
nnoremap <S-Y> y$

" Make the arrow keys move up and down *visible* lines
" i.e. they work slightly different than j and k, but this is often useful
map <Up> gk
map <Down> gj
inoremap <Up> <C-O>gk
inoremap <Down> <C-O>gj

" Use space to remove search highlighting
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
