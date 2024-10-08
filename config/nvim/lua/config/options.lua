local opts = {
  termguicolors = true,
  autochdir = true,
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

local plugins = {
  loaded_2html_plugin= 1,
  loaded_gzip = 1,
  loaded_man = 1,
  loaded_matchit = 1,
  loaded_matchparen = 1,
  loaded_remote_plugins = 1,
  loaded_shada_plugin = 1,
  loaded_spellfile_plugin = 1,
  loaded_tarPlugin= 1,
  loaded_tutor_mode_plugin = 1,
  loaded_zip = 1,
  netrw_altv = 1,
  netrw_banner = 0,
  netrw_browse_split = 4,
  netrw_hide = 1,
  netrw_keepdir = 0,
  netrw_liststyle = 3,
  netrw_winsize = 20,
}

-- Set options
for key, value in pairs(opts) do
  vim.opt[key] = value
end

-- Set plugins
for key, value in pairs(plugins) do
  vim.g[key] = value
end

-- Ignore node_modules
vim.opt.wildignore:append { '*/node_modules/*' }

-- Search recursively in current directory 
vim.cmd('set path+=**')

