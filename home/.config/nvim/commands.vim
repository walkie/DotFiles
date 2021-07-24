" Open help in the current window with :Help
command! -bar -nargs=? -complete=help Help call s:HelpHere(<q-args>)

function! s:HelpHere(subject) abort

  " remember the state of the windows
  let l:window_id = win_getid()
  let l:window_width = winwidth(0)
  let l:num_windows = winnr('$')
  
  " open the help window
  execute 'help ' .. a:subject

  " close the original window if a new help window was opened, and if it
  " should have opened immediately above the original window
  if l:num_windows < winnr('$') && (l:num_windows == 1 || l:window_width >= 80)
    call win_execute(l:window_id, 'close')
  endif

endfunction
