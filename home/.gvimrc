if has('gui_macvim')
  set guioptions=egmrt           " remove the toolbar
  set lines=999 columns=9999     " make the window big
else
  set guioptions=egrt            " remove the toolbar and menu bar
endif
autocmd VimEnter * set vb t_vb=  " disable bell and visual bell
call NormalStyle()               " set up the visual style of the GUI
