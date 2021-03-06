let $VIMPLUG_DIR = $VIMDATA . '/plugged'
let $VIMPLUG_EXE = $VIMDATA . '/site/autoload/plug.vim'

" Install vim-plug if not already installed
" (If on Windows, do this step manually...)
"   :PlugUpdate    updates plugins managed by vim-plug
"   :PlugUpgrade   updates vim-plug itself
if empty($VIMPLUG_EXE)
  silent !curl -fLo $VIMPLUG_EXE --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify plugin directory
call plug#begin($VIMPLUG_DIR)

" Buffer Explorer (B in normal mode to open)
Plug 'jlanzarotta/bufexplorer'
let g:bufExplorerShowRelativePath = 1
nnoremap B :BufExplorer<CR>

" NERD tree file explorer (T in normal mode to open)
Plug 'preservim/nerdtree'
let g:NERDTreeMouseMode=2
let g:NERDTreeMapOpenInTabSilent="<C-T>"
nnoremap T :NERDTreeToggle<CR>

" Fuzzy file finder
Plug 'ctrlpvim/ctrlp.vim'

" YankRing (:yr to open)
" Plug 'vim-scripts/YankRing.vim'
" let g:yankring_history_dir = '$VIMDATA'
" cabbr yr YRShow

" Tab completion (<Tab> file/text completion, <C-Space> omni-completion)
Plug 'ervandew/supertab'
let g:SuperTabNoCompleteAfter = ['^\s*']
let g:SuperTabDefaultCompletionType = 'context'
imap <C-Space> <C-R>=SuperTabAlternateCompletion('<C-X><C-O>')<CR>

" Setup vimwiki as a vim schlub's org-mode
" if has("unix")
"   " Personal wiki
"   Plug 'vimwiki/vimwiki', { 'branch': 'stable' }
"   let g:vimwiki_use_mouse = 1
"   let g:vimwiki_menu = 'Plugin.Vimwiki'
"   let g:vimwiki_list =
"     \ [{ 'path': "$HOME/Dropbox/Wiki",
"     \    'syntax': 'markdown',
"     \    'ext': '.wiki' }]
" 
"   " Integrate vimwiki with Taskwarrior.
"   Plug 'tbabej/taskwiki',
"     \ { 'branch': 'extra-syntaxes',
"     \   'do': function('InstallTasklib') }
"   " Use markdown syntax
"   let g:taskwiki_syntax = 'markdown'
" endif

" Nicer file system and Git integration
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'

" Language server support
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Haskell stuff
Plug 'raichoo/haskell-vim'
let g:haskell_enable_quantification = 1  " highlight `forall`
let g:haskell_enable_recursivedo = 1     " highlight `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1     " highlight `proc`
" let g:haskell_indent_case = 2
" let g:haskell_indent_do = 3
let g:haskell_indent_disable = 1
let g:cabal_indent_section = 2

" Liquid Haskell
" Plug 'scrooloose/syntastic'
" Plug 'panagosg7/vim-annotations'
" Plug 'ucsd-progsys/liquid-types.vim'
" let g:vim_annotations_offset = '/.liquid/'

" LLVM
Plug 'llvm-mirror/llvm', { 'rtp': 'utils/vim' }

" Other language-specific plugins
Plug 'rust-lang/rust.vim'
Plug 'idris-hackers/idris-vim'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-markdown'
Plug 'vim-scripts/coq-syntax'
Plug 'vim-scripts/mips.vim'
Plug 'derekwyatt/vim-scala'
Plug 'walkie/twelf-vim'
Plug 'habamax/vim-godot'
" Plug 'joaopizani/agda-vim'
" Plug 'wlangstroth/vim-racket'

" General utilities
Plug 'salsifis/vim-transpose'
Plug 'godlygeek/tabular'

" Alternate colorscheme
" Plug 'morhetz/gruvbox'
" let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_contrast_light = 'hard'

" Initialize plugins
call plug#end()
