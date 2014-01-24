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
NeoBundle 'Shougo/vimproc.vim', { 'build' :
    \ { 'mac'  : 'make -f make_mac.mak'
    \ , 'unix' : 'make -f make_unix.mak' } }
NeoBundle 'Shougo/vimshell.vim'

" Interact with ghc-mod (first: cabal install ghc-mod)
NeoBundle 'eagletmt/ghcmod-vim'

" Other language-specific plugins
NeoBundle 'idris-hackers/idris-vim'
NeoBundle 'groenewege/vim-less'
NeoBundle 'wlangstroth/vim-racket'

" General utilities
NeoBundle 'ervandew/supertab'
NeoBundle 'salsifis/vim-transpose'
