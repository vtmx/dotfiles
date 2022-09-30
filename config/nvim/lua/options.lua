------------------------------------------------------------
-- settings
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
vim.g['netrw_altv'] = 1
vim.g['netrw_banner'] = 0
vim.g['netrw_browse_split'] = 4
vim.g['netrw_hide'] = 1
vim.g['netrw_liststyle'] = 4
vim.g['netrw_winsize'] = 25


-- indent-blanklinke
-- fix indentline color
hl_mode = 'combine'
vim.wo.colorcolumn = '99999'

-- plugins

-- highlightedyank
vim.g.highlightedyank_highlight_duration = 150

-- lsp
vim.lsp.handlers['textDocument/publishDiagnostics'] =
vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  -- Disable underline, it's very annoying
  underline = false,
  virtual_text = false,
  signs = true,
  update_in_insert = false
})
