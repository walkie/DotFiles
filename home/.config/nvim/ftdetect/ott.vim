" https://stackoverflow.com/questions/73015643/autocmd-does-not-detect-ott-files
" This is the nuclear option since the zip plugin detects a huge number of
" file extensions. However, I don't think I rely on this at all, so I'm fine
" hacking it down to just .zip files.
let g:zipPlugin_ext='*.zip'

autocmd BufRead,BufNewFile *.ott set filetype=ott
