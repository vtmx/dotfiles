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
--opt.clipboard = 'unnamed,unnamedplus'
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
vim.g['netrw_altv'] = 1
vim.g['netrw_banner'] = 0
vim.g['netrw_browse_split'] = 4
vim.g['netrw_hide'] = 1
vim.g['netrw_liststyle'] = 4
vim.g['netrw_winsize'] = 25
-- vim.g['netrw_list_hide'] = '^\.\.\=/\=$,.git,__pycache__,venv,node_modules,*\.o,*\.pyc,.*\.swp'


-- indent-blanklinke
-- fix indentline color
hl_mode = 'combine'
vim.wo.colorcolumn = '99999'

-- plugins

-- better-scape
vim.g.better_escape_shortcut = 'kj' 
vim.g.better_escape_interval = 200 

-- highlightedyank
vim.g.highlightedyank_highlight_duration = 150

-- enable enter icon
-- opt.list = true
-- opt.listchars:append('eol:↴')

-- lsp
vim.lsp.handlers['textDocument/publishDiagnostics'] =
vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		-- Disable underline, it's very annoying
		underline = false,
		virtual_text = false,
		signs = true,
		update_in_insert = false
})
