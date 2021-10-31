-- vars
local cmd = vim.cmd
local opt = vim.opt

-- sets
vim.o.termguicolors = true

opt.autochdir = true
opt.smartindent = true
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
opt.shiftwidth = indent 
opt.tabstop = indent 
opt.softtabstop = indent 

-- interface
opt.splitbelow = true
opt.splitright = true

-- netrw
netrw_banner = 0
netrw_hide = 1
netrw_browse_split = 4
netrw_altv = 1
netrw_liststyle = 3
netrw_winsize = 20
