------------------------------------------------------------
-- settings
-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua
------------------------------------------------------------

-- vars
local opt = vim.opt

if vim.fn.has('nvim-0.8') == 1 then
  opt.winbar = '%f'
  -- opt.cmdheight = 0
else
  opt.cmdheight = 1
end

opt.termguicolors = true
opt.title = true
opt.autochdir = true
opt.cursorline = true
opt.shell = 'fish'
opt.exrc = true
opt.ignorecase = true
opt.smartcase = true
opt.lazyredraw = true
opt.mouse = 'a'
-- opt.clipboard:append { 'unnamedplus' }

-- notification
opt.backup = false
opt.swapfile = false

-- number
opt.number = true
opt.relativenumber = true

-- wrap
opt.wrap = false
opt.textwidth = 0
opt.wrapmargin = 0

-- indent
local indent = 2
opt.expandtab = true
opt.smartindent = true
opt.shiftwidth = indent 
opt.tabstop = indent 
opt.softtabstop = indent 
opt.wildignore:append { '*/node_modules/*' }

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

-- highlight yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ timeout = 150 })
  end
})

-- disable auto comments
vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { 'c', 'r', 'o' }
  end
})
