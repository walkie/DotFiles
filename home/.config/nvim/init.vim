" Formatting and display
set tabstop=2      " tabs show up as 2 spaces
set shiftwidth=2   " smartindent does 2 spaces
set expandtab      " turn tabs into spaces ...
set nosmarttab     " and don't try to be clever about it
set nowrap         " don't wrap long lines
syntax enable      " turn on syntax highlighting

" Turn on mouse support
set mouse=a

" Set default colors and color scheme
set termguicolors  " requires true color terminal
set cul            " highlight current line
if has('nvim')
  " set pumblend=15    " transparent pop-up menus
  " set winblend=15    " transparent floating windows
endif

" Ignore whitespace in diff-mode
set diffopt+=iwhite " ignore whitespace in diff-mode

" Adjust list of suffixes to ignore for file completion
set suffixes-=.h,.info
set suffixes+=.aux,.bbl,.blg,.dvi,.log,.pdf,.ps,.synctex.gz,.toc

" Home of vim config files
if has('nvim')
  let $VIMDATA = stdpath('data')
  let $VIMCONFIG = stdpath('config')
elseif has('win32') || has('win64')
  let $VIMDATA = $HOME . '/vimfiles'
  let $VIMCONFIG = $VIMDATA . '/config'
else
  let $VIMDATA = $HOME . '/.local/share/nvim'
  let $VIMCONFIG = $HOME . '/.config/nvim'
endif

" Load plugins
source $VIMCONFIG/plugins.vim

" Add my commands, functions, and key-mappings
source $VIMCONFIG/commands.vim
source $VIMCONFIG/functions.vim
source $VIMCONFIG/maps.vim

" Configure tab-completion
source $VIMCONFIG/completion.vim

" Configure status line
source $VIMCONFIG/statusline.vim

" Configure language server protocol support
if has('nvim')
  source $VIMCONFIG/lsp.vim
endif

" Configure spell-checking files
let $SPELLDIR = $VIMCONFIG . '/spell'
call ReloadSpellFiles()

" Tweak visual stuff
call NormalStyle()

" Load my after scripts last
set runtimepath-=$VIMCONFIG/after
set runtimepath+=$VIMCONFIG/after
