local opts = {
  termguicolors = true,
  autochdir = true,
  autoindent = false,
  cursorline = true,
  exrc = true,
  ignorecase = true,
  smartcase = true,
  lazyredraw = true,
  swapfile = false,
  scrolloff = 10,
  number = true,
  relativenumber = true,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2,
  splitbelow = true,
  splitright = true,
  listchars = {eol = '↲', space = '.', tab = '›-', trail = '⋯'},
  spelllang = 'pt-BR',
}

-- Set options
for key, value in pairs(opts) do
  vim.opt[key] = value
end

-- Ignore node_modules
vim.opt.wildignore:append { '*/node_modules/*' }

-- Search recursively in current directory 
vim.cmd('set path+=**')

