------------------------------------------------------------
-- settings
-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua
------------------------------------------------------------

-- vars
local opt = vim.opt

-- sets
opt.termguicolors = true
opt.title = true
opt.autochdir = true
opt.cursorline = true
opt.cmdheight = 1
opt.exrc = true
opt.ignorecase = true
opt.smartcase = true
opt.lazyredraw = true
opt.mouse = 'a'

-- notification
opt.backup = false
opt.swapfile = false

-- wrap
opt.wrap = false
opt.textwidth = 0
opt.wrapmargin = 0

-- number
opt.number = true
opt.relativenumber = true

-- indent
local indent = 2
opt.expandtab = true
opt.smartindent = true
opt.shiftwidth = indent 
opt.tabstop = indent 
opt.softtabstop = indent 

-- split
opt.laststatus = 3
opt.splitbelow = true
opt.splitright = true

-- netrw
vim.g.netrw_altv = 1
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4
vim.g.netrw_hide = 1
vim.g.netrw_liststyle = 4
vim.g.netrw_winsize = 25

-- indent-blanklinke
-- fix indentline color
hl_mode = 'combine'
vim.wo.colorcolumn = '99999'

-- highlight yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function(event)
    vim.highlight.on_yank({timeout = 50})
  end
})
