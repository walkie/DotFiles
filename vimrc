" Turn off vi compatibility
set nocompatible

" Formatting and display
set tabstop=2    " tabs show up as 2 spaces
set shiftwidth=2 " smartindent does 2 spaces
set expandtab    " turn tabs into spaces
set autoindent   " start next line at same indent level
set nowrap       " don't wrap long lines
set ruler        " turn the ruler on
set backspace=2  " backspace over anything
syntax enable    " turn on syntax highlighting

" When wrapping, show the last line even if it is too long
set display+=lastline

" Set default font encoding
set encoding=utf-8
set fileencoding=utf-8

" Searching
set incsearch " incremental search
set hlsearch  " turn on search highlighting
highlight clear Search
highlight Search ctermbg=DarkGray

" Ignore whitespace in diff-mode
set diffopt+=iwhite " ignore whitespace in diff-mode

" Add suffixes to ignore when completing files on comand line
set suffixes+=.aux,.bbl,.blg,.dvi,.log,.pdf,.ps,.synctex.gz,.toc

" Put all swap files in the same directory
set directory=~/.vim/swap,.

" Add my functions and key-mappings, load plugins, configure status line
source ~/.vim/config/functions.vim
source ~/.vim/config/maps.vim
source ~/.vim/config/plugins.vim
" source ~/.vim/config/airline.vim
source ~/.vim/config/statusline.vim

" Turn on ftplugin wizardry (vim-plug does this automatically)
" filetype plugin indent on

" Load my after scripts last
set runtimepath-=~/.vim/after
set runtimepath+=~/.vim/after
