-- Vars
local g = vim.g
local opt = vim.opt

-- News
-- if vim.fn.has('nvim-0.8') == 1 then
--   opt.winbar = '%f'
--   opt.cmdheight = 0
-- else
--   opt.cmdheight = 1
-- end

-- if vim.fn.has('nvim-0.10') == 1 then
--   opt.smoothscroll = true
-- end

local indent = 2

local opts = {
  termguicolors = true,
  title = true,
  autochdir = true,
  cursorline = true,
  shell = 'fish',
  exrc = true,
  ignorecase = true,
  smartcase = true,
  lazyredraw = true,
  mouse = 'a',

  -- notification
  backup = false,
  swapfile = false,

  -- number
  number = true,
  relativenumber = true,

  -- wrap
  wrap = false,
  textwidth = 0,
  wrapmargin = 0,

  -- indent
  expandtab = true,
  smartindent = true,
  shiftwidth = indent ,
  tabstop = indent ,
  softtabstop = indent ,

  -- list char
  listchars = 'tab:›-,space:·,trail:⋯,eol:↲',

  -- split
  laststatus = 3,
  splitbelow = true,
  splitright = true,
}

opt.wildignore:append { '*/node_modules/*' }

for k, v in pairs(opts) do
  opt[k] = v
end

local gs = {
  netrw_altv = 1,
  netrw_banner = 0,
  netrw_browse_split=4,
  netrw_hide = 1,
  netrw_keepdir = 0,
  netrw_liststyle = 3,
  netrw_winsize = 20,

  -- Disable plugins
  loaded_zip = 1,
  loaded_gzip = 1,
  loaded_man = 1,
  loaded_matchit = 1,
  loaded_matchparen = 1,
  -- loaded_netrwPlugin = 1,
  loaded_remote_plugins = 1,
  loaded_shada_plugin = 1,
  loaded_spellfile_plugin = 1,
  loaded_tarPlugin= 1,
  loaded_2html_plugin= 1,
  loaded_tutor_mode_plugin = 1,
}

for k, v in pairs(gs) do
  g[k] = v
end

-- Search current directory recursively
vim.cmd('set path+=**')

-- References
-- https://shapeshed.com/vim-netrw
-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua
-- https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer

