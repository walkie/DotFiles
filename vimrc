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

" Searching
set incsearch    " incremental search
set nohlsearch   " turn off search highlighting

" Ignore whitespace in diff-mode
set diffopt+=iwhite " ignore whitespace in diff-mode

" Add suffixes to ignore when completing files on comand line
set suffixes+=.aux,.bbl,.blg,.dvi,.log,.pdf,.ps,.toc

" Put all swap files in the same directory
set directory=~/.vim/swap,.

" Add my functions and key-mappings, load plugins
source ~/.vim/config/ftdetect.vim
source ~/.vim/config/functions.vim
source ~/.vim/config/maps.vim
source ~/.vim/config/plugins.vim

" Turn on ftplugin wizardry (must come after plugins)
filetype plugin indent on
