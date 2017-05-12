" Install vim-plug if not already installed
"   :PlugUpdate    updates plugins managed by vim-plug
"   :PlugUpgrade   updates vim-plug itself
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify plugin directory
call plug#begin('~/.vim/plugins')

" Run asynchronous processes
" Needed by ghcmod-vim (and maybe others)
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" Buffer Explorer (B in normal mode to open)
Plug 'jlanzarotta/bufexplorer'
let g:bufExplorerShowRelativePath = 1
nmap B <Leader>be

" NERD tree file explorer (T in normal mode to open)
Plug 'scrooloose/nerdtree'
let g:NERDTreeMouseMode=2
let g:NERDTreeMapOpenInTabSilent="<C-T>"
nnoremap <S-T> :NERDTreeToggle<CR>

" YankRing (:yr to open)
Plug 'vim-scripts/YankRing.vim'
let g:yankring_history_dir = '~/.vim'
cabbr yr YRShow

" Tab completion (<Tab> file/text completion, <C-Space> omni-completion)
Plug 'ervandew/supertab'
let g:SuperTabNoCompleteAfter = ['^\s*']
let g:SuperTabDefaultCompletionType = 'context'
if has("gui_running")
  imap <C-Space> <C-R>=SuperTabAlternateCompletion('<C-X><C-O>')<CR>
else
  imap <NUL> <C-R>=SuperTabAlternateCompletion('<C-X><C-O>')<CR>
endif

" Nicer file system and Git integration
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'

" Haskell stuff (first: cabal install ghc-mod)
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'
Plug 'raichoo/haskell-vim'
let g:haskell_enable_quantification = 1  " highlight `forall`
let g:haskell_enable_recursivedo = 1     " highlight `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1     " highlight `proc`
let g:haskell_indent_case = 2
let g:haskell_indent_do = 3
let g:cabal_indent_section = 2

" Liquid Haskell
" Plug 'scrooloose/syntastic'
" Plug 'panagosg7/vim-annotations'
" Plug 'ucsd-progsys/liquid-types.vim'
" let g:vim_annotations_offset = '/.liquid/'

" Other language-specific plugins
Plug 'idris-hackers/idris-vim'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-markdown'
Plug 'vim-scripts/coq-syntax'
Plug 'vim-scripts/mips.vim'
Plug 'derekwyatt/vim-scala'
Plug 'walkie/twelf-vim'
" Plug 'joaopizani/agda-vim'
" Plug 'wlangstroth/vim-racket'

" General utilities
Plug 'salsifis/vim-transpose'

" Initialize plugins
call plug#end()
