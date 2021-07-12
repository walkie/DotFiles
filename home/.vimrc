" Neovim data and configuration directories
let $VIMDATA = $HOME . '/.local/share/nvim'
let $VIMCONFIG = $HOME . '/.config/nvim'

" These are set by default in Neovim
set nocompatible " turn off vi compatibility
set autoindent   " start next line at same indent level
set ruler        " turn the ruler on
set backspace=2  " backspace over anything
set encoding=utf-8
set fileencoding=utf-8

" Use Neovim data and configuration
set runtimepath+=$VIMDATA
set runtimepath+=$VIMDATA/site
set runtimepath+=$VIMCONFIG
source $VIMCONFIG/init.vim
