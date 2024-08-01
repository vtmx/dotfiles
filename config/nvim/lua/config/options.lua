local opts = {
  termguicolors = true,
  title = true,
  autochdir = true,
  cursorline = true,
  shell = 'bash',
  exrc = true,
  ignorecase = true,
  smartcase = true,
  lazyredraw = true,
  mouse = 'a',
  backup = false,
  swapfile = false,
  number = true,
  relativenumber = true,
  wrap = false,
  textwidth = 0,
  wrapmargin = 0,
  expandtab = true,
  smartindent = true,
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2,
  laststatus = 3,
  splitbelow = true,
  splitright = true,
  listchars = 'tab:›-,space:·,trail:⋯,eol:↲',
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
  netrw_browse_split=4,
  netrw_hide = 1,
  netrw_keepdir = 0,
  netrw_liststyle = 3,
  netrw_winsize = 20,
}

-- Set options
for key, value in pairs(opts) do
  vim.opt[key] = value
end

-- Set native plugins
for key, value in pairs(plugins) do
  vim.g[key] = value
end

-- Ignore node_modules
vim.opt.wildignore:append { '*/node_modules/*' }

-- Search current directory recursively
vim.cmd('set path+=**')

-- Links
-- https://shapeshed.com/vim-netrw
-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua
-- https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer
