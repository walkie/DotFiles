" Turn-on NeoBundle plugin manager
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" Buffer Explorer (B in normal mode to open)
NeoBundle 'jlanzarotta/bufexplorer'
let g:bufExplorerShowRelativePath=1
nmap B \be

" YankRing (:yr to open)
NeoBundle 'vim-scripts/YankRing.vim'
let g:yankring_history_dir = '~/.vim'
cabbr yr YRShow

" Interacting with the shell
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/vimshell.vim'

" Language-specific plugins
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'idris-hackers/idris-vim'
NeoBundle 'groenewege/vim-less'
NeoBundle 'wlangstroth/vim-racket'

" General utilities
NeoBundle 'ervandew/supertab'
NeoBundle 'salsifis/vim-transpose'
