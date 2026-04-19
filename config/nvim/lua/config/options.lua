local opts = {
  autochdir = true,
  autocomplete = true,
  clipboard = 'unnamedplus',
  cursorline = true,
  diffopt = 'internal,filler,closeoff,indent-heuristic,linematch:60,algorithm:histogram',
  expandtab = true,
  ignorecase = true,
  lazyredraw = true,
  listchars = { eol = '↲', nbsp = '+', space = '.', tab = '›-', trail = '⋯' },
  number = true,
  pumborder = 'rounded',
  relativenumber = true,
  scrolloff = 8,
  shiftwidth = 2,
  smartcase = true,
  softtabstop = 2,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  tabstop = 2,
  winborder = 'rounded',
  wrap = false
}

local globals = {
  loaded_gzip = 0,
  loaded_node_provider = 0,
  loaded_perl_provider = 0,
  loaded_python3_provider = 0,
  loaded_ruby_provider = 0,
  loaded_tarPlugin= 0,
  loaded_tutor = 0,
  loaded_zipPlugin = 0,
  mapleader = ' ',
  netrw_altv = 1,
  netrw_banner = 0,
  netrw_hide = 1,
  netrw_keepdir = 0,
  netrw_liststyle = 3,
  netrw_winsize = 20,
  vim_markdown_folding_disabled = true
}

-- Set options
for key, value in pairs(opts) do
  vim.opt[key] = value
end

-- Set globals vars
for key, value in pairs(globals) do
  vim.g[key] = value
end

-- Search recursive
vim.opt.path:append('**')

-- Ignore dirs
vim.opt.wildignore:append { 'node_modules/**', 'dist/**', 'public/**' }

-- Set colorscheme
vim.cmd.colorscheme('onedarkv')
