local opts = {
  autochdir = true,
  cursorline = true,
  expandtab = true,
  exrc = true,
  ignorecase = true,
  lazyredraw = true,
  listchars = { eol = '↲', space = '.', tab = '›-', trail = '⋯' },
  number = true,
  relativenumber = true,
  scrolloff = 10,
  shiftwidth = 2,
  smartcase = true,
  softtabstop = 2,
  spelllang = 'pt-BR',
  splitbelow = true,
  splitright = true,
  swapfile = false,
  tabstop = 2,
  termguicolors = true,
  wrap = false,
}

-- Set options
for key, value in pairs(opts) do
  vim.opt[key] = value
end

-- Ignore node_modules
vim.opt.wildignore:append { '*/node_modules/*' }

local g = {
  netrw_altv = 1,
  netrw_banner = 0,
  netrw_hide = 1,
  netrw_keepdir = 0,
  netrw_liststyle = 3,
  netrw_winsize = 20,
}

-- Set global variables
for key, value in pairs(g) do
  vim.g[key] = value
end

-- Search recursively in current directory 
vim.cmd('set path+=**')

