local opts = {
  autochdir = true,
  cursorline = true,
  expandtab = true,
  ignorecase = true,
  lazyredraw = true,
  listchars = { eol = '↲', nbsp = '+', space = '.', tab = '›-', trail = '⋯' },
  number = true,
  relativenumber = true,
  scrolloff = 8,
  shiftwidth = 2,
  smartcase = true,
  softtabstop = 2,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  tabstop = 2,
  updatetime = 250,
  wrap = false
}

-- Set options
for key, value in pairs(opts) do
  vim.opt[key] = value
end

-- Ignore node_modules
vim.opt.wildignore:append { '*/node_modules/*' }

local g = {
  loaded_gzip = 1,
  loaded_node_provider = 0,
  loaded_perl_provider = 0,
  loaded_python3_provider = 0,
  loaded_ruby_provider = 0,
  loaded_tarPlugin= 1,
  loaded_tohtml = 1,
  loaded_tutor = 1,
  loaded_zipPlugin = 1,
  mapleader = ' ',
  netrw_altv = 1,
  netrw_banner = 0,
  netrw_hide = 1,
  netrw_keepdir = 0,
  netrw_liststyle = 3,
  netrw_winsize = 20,
  vim_markdown_folding_disabled = true
}

-- Set global variables
for key, value in pairs(g) do
  vim.g[key] = value
end

-- Search recursively in current directory 
vim.cmd('set path+=**')

-- Loading tmux navigator
vim.cmd('source ' .. os.getenv('HOME') .. '/.config/nvim/lua/plugins/tmux-navigator.vim')
