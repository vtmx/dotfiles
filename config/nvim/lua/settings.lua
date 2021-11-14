------------------------------------------------------------
-- settings
------------------------------------------------------------

-- vars
local cmd = vim.cmd
local opt = vim.opt

-- sets
opt.termguicolors = true
opt.autochdir = true
opt.autoread = true
opt.clipboard = 'unnamed,unnamedplus'
opt.cmdheight = 1
opt.cursorline = true
opt.exrc = true
opt.hidden = true
opt.ignorecase = true
opt.smartcase = true
opt.lazyredraw = true
opt.mouse = 'a'
-- :set formatoptions-=cro

-- notification
opt.backup = false
opt.swapfile = false
opt.errorbells = false
opt.visualbell = false

-- wrap
opt.wrap = false
opt.textwidth = 0
opt.wrapmargin = 0

-- number
opt.number = true
opt.relativenumber = true

-- indent
local indent = 2
opt.autoindent = true
opt.smartindent = true
opt.shiftwidth = indent 
opt.tabstop = indent 
opt.softtabstop = indent 

-- split
opt.splitbelow = true
opt.splitright = true

-- netrw
--cmd [[netrw_banner = 0]]
--cmd [[netrw_hide = 1]]
--cmd [[netrw_browse_split = 4]]
--cmd [[netrw_altv = 1]]
--cmd [[netrw_liststyle = 3]]
--cmd [[netrw_winsize = 20]]

-- indent-blanklinke
-- fix indentline color
hl_mode = 'combine'
vim.wo.colorcolumn = '99999'

-- enable enter icon
-- opt.list = true
-- opt.listchars:append('eol:↴')

