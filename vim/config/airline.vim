" Configure the airline status line. Must run after plugins are loaded.

" Always show the status line
set laststatus=2
  
" Use ASCII
let g:airline_symbols_ascii = 1

" Only show the filetype if it's unexpected
let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'

" Hide info I don't care about
let g:airline_detect_spell = 0
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#wordcount#enabled = 0

" Simplify the line/column number section
call airline#parts#define_raw('position', '%4l:%-3c %3p%%')
" call airline#parts#define_accent('position', 'bold')
let g:airline_section_z = airline#section#create_right(['position'])

" Shorten the mode indicators
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S'
    \ }
