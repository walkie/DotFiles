" Turn-on Vundle plugin manager
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/Vundle.vim
endif
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Buffer Explorer (B in normal mode to open)
Plugin 'jlanzarotta/bufexplorer'
let g:bufExplorerShowRelativePath = 1
nmap B <Leader>be

" NERD tree file explorer (T in normal mode to open)
Plugin 'scrooloose/nerdtree'
let g:NERDTreeMouseMode=2
let g:NERDTreeMapOpenInTabSilent="<C-T>"
nnoremap <S-T> :NERDTreeToggle<CR>

" YankRing (:yr to open)
Plugin 'vim-scripts/YankRing.vim'
let g:yankring_history_dir = '~/.vim'
cabbr yr YRShow

" Tab completion (<Tab> file/text completion, <C-Space> omni-completion)
Plugin 'ervandew/supertab'
let g:SuperTabNoCompleteAfter = ['^\s*']
let g:SuperTabDefaultCompletionType = 'context'
if has("gui_running")
  imap <C-Space> <C-R>=SuperTabAlternateCompletion('<C-X><C-O>')<CR>
else
  imap <NUL> <C-R>=SuperTabAlternateCompletion('<C-X><C-O>')<CR>
endif

" Nicer file system and Git integration
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'

" Haskell stuff (first: cabal install ghc-mod)
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'raichoo/haskell-vim'
let g:haskell_enable_quantification = 1  " highlight `forall`
let g:haskell_enable_recursivedo = 1     " highlight `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1     " highlight `proc`
let g:haskell_indent_case = 2
let g:haskell_indent_do = 3
let g:cabal_indent_section = 2

" Liquid Haskell
" Plugin 'scrooloose/syntastic'
" Plugin 'panagosg7/vim-annotations'
" Plugin 'ucsd-progsys/liquid-types.vim'
" let g:vim_annotations_offset = '/.liquid/'

" Other language-specific plugins
Plugin 'idris-hackers/idris-vim'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-markdown'
Plugin 'vim-scripts/coq-syntax'
Plugin 'vim-scripts/mips.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'walkie/twelf-vim'
" Plugin 'joaopizani/agda-vim'
" Plugin 'wlangstroth/vim-racket'

" General utilities
Plugin 'salsifis/vim-transpose'

" This has to be called after all bundles are listed
call vundle#end()
