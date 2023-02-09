local opt = vim.opt

-- Tabs and indenting
opt.tabstop = 2       -- tabs show up as 2 spaces
opt.shiftwidth = 2    -- smartindent does 2 spaces
opt.expandtab = true  -- turn tabs into spaces ...
opt.smarttab = false  -- and don't try to be clever about it

-- Don't wrap long lines
opt.wrap = false

-- Turn on mouse support
opt.mouse = 'a'

-- Update gutters and write to swap more frequently (100 ms)
opt.updatetime = 100

-- Colors
opt.termguicolors = true  -- requires true color terminal
opt.cul = true            -- highlight current line
-- opt.pumblend = 25  -- transparent pop-up menus
-- opt.winblend = 25  -- transparent floating windows

-- Ignore whitespace in diff-mode
opt.diffopt:append({ iwhite = true })


-- Adjust list of suffixes to ignore for file completion
opt.suffixes:remove({ ".h", ".info"})
opt.suffixes:append({ ".aux", ".bbl", ".blg", ".dvi", ".log", ".pdf", ".ps", ".synctex.gz", ".toc" })

-- Load plugins
require("walkie/plugins")

require("walkie/maps")

vim.cmd([[
  let $VIMDATA = stdpath('data')
  let $VIMCONFIG = stdpath('config')


  " Add my commands, functions, and key-mappings
  source $VIMCONFIG/commands.vim
  source $VIMCONFIG/functions.vim

  " Configure status line
  source $VIMCONFIG/statusline.vim

  " Configure spell-checking files
  let $SPELLDIR = $VIMCONFIG . '/spell'
  call ReloadSpellFiles()

  " Tweak visual stuff
  call NormalStyle()

]])

-- Load my after scripts last
local after_path = vim.fn.stdpath("config") .. "/after"
opt.runtimepath:remove(after_path)
opt.runtimepath:append(after_path)
