-- vars
local opt = vim.opt

-- sets
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
opt.backup = true
opt.swapfile = true
opt.errorbells = true
opt.visualbell = true

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
