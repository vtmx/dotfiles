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
  loaded_2html_plugin = 1,
  loaded_getscript = 1,
  loaded_getscriptPlugin = 1,
  loaded_gzip = 1,
  loaded_logiPat = 1,
  loaded_man = 1,
  loaded_matchit = 1,
  loaded_matchparen = 1,
  loaded_node_provider = 0,
  loaded_perl_provider = 0,
  loaded_python3_provider = 0,
  loaded_remote_plugins = 1,
  loaded_rrhelper = 1,
  loaded_ruby_provider = 0,
  loaded_shada_plugin = 1,
  loaded_spellfile_plugin = 1,
  loaded_tar = 1,
  loaded_tarPlugin= 1,
  loaded_tutor_mode_plugin = 1,
  loaded_vimball = 1,
  loaded_vimballPlugin = 1,
  loaded_zip = 1,
  loaded_zipPlugin = 1,
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

