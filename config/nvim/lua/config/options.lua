local opts = {
  autochdir = true,
  cursorline = true,
  expandtab = true,
  exrc = true,
  ignorecase = true,
  lazyredraw = true,
  listchars = {eol = '↲', space = '.', tab = '›-', trail = '⋯'},
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
}

-- Set options
for key, value in pairs(opts) do
  vim.opt[key] = value
end

-- Ignore node_modules
vim.opt.wildignore:append { '*/node_modules/*' }

-- Search recursively in current directory 
vim.cmd('set path+=**')

