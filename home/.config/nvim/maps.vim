" Set the <Leader> and <LocalLeader> keys
let mapleader = '\'
let maplocalleader = '-'

" Enable Emacs-style line movement
noremap <C-A> <Home>
noremap <C-E> <End>
inoremap <C-A> <Home>
inoremap <C-E> <End>
cnoremap <C-A> <HOME>

" Insert a blank line from normal mode
nnoremap <C-Space> ^i<Return><Esc>

" Make window switching easier (see: vim-tmux-navigator plugin)
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l
" if has('nvim')
"   tnoremap <C-h> <C-\><C-N><C-w>h
"   tnoremap <C-j> <C-\><C-N><C-w>j
"   tnoremap <C-k> <C-\><C-N><C-w>k
"   tnoremap <C-l> <C-\><C-N><C-w>l
" endif

" Make Y copy to the end of the line
nnoremap <S-Y> y$

" Copy current selection to system clipboard
vnoremap <C-C> "+y
if $TERM_PROGRAM == 'iTerm.app'
  vnoremap <M-c> "+y
endif

" Paste from system clipboard
inoremap <C-V> <C-O>:call InsertClipboardPaste()<CR>

" Move relative to visual lines
noremap 0 g0
noremap $ g$
noremap k gk
noremap j gj
noremap <Up> gk
noremap <Down> gj
inoremap <Up> <C-O>gk
inoremap <Down> <C-O>gj

" Use space to remove search highlighting
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Use escape in embedded terminal
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif
