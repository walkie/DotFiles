" Turn-on NeoBundle plugin manager
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" Interacting with the shell
NeoBundle 'Shougo/vimproc.vim', { 'build' :
    \ { 'mac'  : 'make -f make_mac.mak'
    \ , 'unix' : 'make -f make_unix.mak' } }
NeoBundle 'Shougo/vimshell.vim'

" Buffer Explorer (B in normal mode to open)
NeoBundle 'jlanzarotta/bufexplorer'
let g:bufExplorerShowRelativePath = 1
nmap B <Leader>be

" NERD tree file explorer
NeoBundle 'scrooloose/nerdtree'
let g:NERDTreeMouseMode=2
let g:NERDTreeMapOpenInTabSilent="<C-T>"
nnoremap <S-T> :NERDTreeToggle<CR>

" YankRing (:yr to open)
NeoBundle 'vim-scripts/YankRing.vim'
let g:yankring_history_dir = '~/.vim'
cabbr yr YRShow

" Tab completion (<Tab> file/text completion, <C-Space> omni-completion)
NeoBundle 'ervandew/supertab'
let g:SuperTabNoCompleteAfter = ['^\s*']
let g:SuperTabDefaultCompletionType = 'context'
if has("gui_running")
  imap <C-Space> <C-R>=SuperTabAlternateCompletion('<C-X><C-O>')<CR>
else
  imap <NUL> <C-R>=SuperTabAlternateCompletion('<C-X><C-O>')<CR>
endif

" Interact with ghc-mod (first: cabal install ghc-mod)
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'eagletmt/neco-ghc'

" Other language-specific plugins
NeoBundle 'idris-hackers/idris-vim'
NeoBundle 'groenewege/vim-less'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'vim-scripts/coq-syntax'
NeoBundle 'vim-scripts/mips.vim'
NeoBundle 'derekwyatt/vim-scala'
" NeoBundle 'joaopizani/agda-vim'
" NeoBundle 'wlangstroth/vim-racket'

" General utilities
NeoBundle 'salsifis/vim-transpose'

" This has to be called after all bundles are listed
call neobundle#end()

" Install plugins on start up
NeoBundleCheck
