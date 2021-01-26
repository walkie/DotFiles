if has('gui_macvim')

  " remove the toolbar
  set guioptions=egmrt

  " make the window big
  set lines=999 columns=9999

else

  " remove the toolbar and menu bar
  " set guioptions=egrt

  " disable all GUI stuff; there's a weird bug I encountered in Jan 2021 that
  " is related to the scroll bars (https://github.com/vim/vim/issues/480),
  " where redrawing the cursor is prevented after switching windows or split
  " panes... super annoying!
  set guioptions=

endif

" disable bell and visual bell
autocmd VimEnter * set vb t_vb=

" set up the visual style of the GUI
call NormalStyle()
