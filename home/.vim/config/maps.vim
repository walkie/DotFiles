" Set the <Leader> and <LocalLeader> keys
let mapleader = ';'
let maplocalleader = ','

" Emacs-style movement in command mode
cnoremap <C-A> <HOME>

" Insert a blank line from normal mode
nnoremap <S-RETURN> ^i<RETURN><ESC>

" Make window switching easier
nnoremap <S-J> <C-W>j
nnoremap <S-K> <C-W>k
nnoremap <S-H> <C-W>h
nnoremap <S-L> <C-W>l

" Make Y copy to the end of the line
nnoremap <S-Y> y$

" Move relative to visual lines
noremap 0 g0
noremap $ g$
noremap k gk
noremap j gj
noremap <Up> gk
noremap <Down> gj

vnoremap 0 g0
vnoremap $ g$
vnoremap k gk
vnoremap j gj
vnoremap <Up> gk
vnoremap <Down> gj

inoremap <Up> <C-O>gk
inoremap <Down> <C-O>gj

" Enable Emacs/Mac-style line movement
noremap <C-A> <Home>
noremap <C-E> <End>
inoremap <C-A> <Home>
inoremap <C-E> <End>

" Use space to remove search highlighting
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
