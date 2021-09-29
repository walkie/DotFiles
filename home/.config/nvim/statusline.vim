" Always show the status line
set laststatus=2

" on the left:
"   relative filename
"   modified flag
"   read-only flag
set statusline=%{expand('%:~:.')}
set statusline+=\ %m\ %r

" on the right:
"   filetype
"   file format if not unix
"   font encoding if not utf-8
"   line and column numbers
"   percentage through file
set statusline+=%=%{&ft}
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%{(&fenc!='utf-8')?((&fenc!='')?'['.&fenc.']':''):''}
set statusline+=\ \ %4l:%-3c\ %3p%%
