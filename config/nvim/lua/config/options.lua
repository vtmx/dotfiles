local opts = {
  autochdir = true,
  autocomplete = true,
  autoread = true,
  clipboard = 'unnamedplus',
  cmdheight = 0,
  completeopt = { 'menu', 'menuone', 'noinsert' },
  cursorline = true,
  diffopt = 'internal,filler,closeoff,indent-heuristic,linematch:60,algorithm:histogram',
  expandtab = true,
  fillchars = { eob = ' ' },
  ignorecase = true,
  listchars = { eol = '↲', nbsp = '+', space = '.', tab = '›-', trail = '⋯' },
  number = true,
  path = { '**' },
  pumborder = 'rounded',
  pumheight = 10,
  relativenumber = true,
  scrolloff = 8,
  shiftwidth = 2,
  smartcase = true,
  softtabstop = 2,
  spelllang = { 'en', 'pt_br' },
  splitbelow = true,
  splitright = true,
  swapfile = false,
  tabstop = 2,
  updatetime = 250,
  wildignore = { 'dist/**', 'node_modules/**', 'public/**', '.git/**' },
  winborder = 'rounded',
  wrap = false,
}

local globals = {
  health = { style = 'float' },
  loaded_2html_plugin = 1,
  loaded_gzip = 1,
  loaded_matchparen = 1,
  loaded_netrw = 1,
  loaded_netrwPlugin = 1,
  loaded_node_provider = 0,
  loaded_perl_provider = 0,
  loaded_python3_provider = 0,
  loaded_ruby_provider = 0,
  loaded_tarPlugin = 1,
  loaded_tutor = 1,
  loaded_zipPlugin = 1,
  mapleader = ' ',
  vim_markdown_folding_disabled = true,
}

-- Set options
for key, value in pairs(opts) do
  vim.opt[key] = value
end

-- Set globals vars
for key, value in pairs(globals) do
  vim.g[key] = value
end

-- Set colorscheme
vim.cmd.colorscheme('onedarkv')
