-- Function for mapping
local function map(mode, lhs, rhs, opts)
  local opts = opts or { silent = true }
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Leader key
vim.g.mapleader = ' '

map(
  'n',
  '<leader>r',
  '<cmd>w<cr><cmd>so<cr><cmd>echo "source" bufname("%")<cr>',
  { desc = 'Reload config file' }
)

-- Scape
map('i', 'kj', '<esc>')

-- Return to normal mode
map('v', 'ç', '<esc>')
map('v', '<leader>kj', '<esc>')

-- Navigate in insertmode
map('i', '<c-h>', '<left>')
map('i', '<c-l>', '<right>')

-- Paste register
map('i', '<c-v>', '<c-r>"')

-- Ignore wordwrap jumpline
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- Like C and D
map('n', 'Y', 'y$')

-- Begin and end line
map({'n', 'v'}, 'L', 'g_')
map({'n', 'v'}, 'H', '^')

-- Jump various lines
map({'n', 'v'}, 'J', '5j')
map({'n', 'v'}, 'K', '5k')

-- Jump half page in the middle
map('n', '<c-d>', '<c-d>zz')
map('n', '<c-u>', '<c-u>zz')

-- Change text without putting it into the vim register
map({'n', 'x'}, 'c', '"_c')
map('n', 'C', '"_C')
map('n', 'cc', '"_cc')

-- Add new line in normal mode
map('n', '<leader>o', 'm`o<esc>``')
map('n', '<leader>O', 'm`O<esc>``')

-- Plus number
map('n', '=', '<c-a>')
map('n', '-', '<c-x>')

-- Select all
map('n', '<leader>a', 'G<s-v>gg', { desc = 'Select all' })

map('n', '%', 'G<s-v>gg', { desc = 'Select all' })
map('n', 'U', '<c-r>', { desc = 'Redo' })

-- Mark
map('n', 'm', '`')
map('n', 'M', 'm')

-- Register
map('n', "'", '"')
map('v', "'", '"')

-- Clipboard

map(
  'v',
  '<leader>y',
  '"+ygv<esc><cmd>echo "Copy to clipboard"<cr>',
  { desc = 'Yanki selectted line to clipboard' }
)

map(
  'n',
  '<leader>y',
  '"+yy<cmd>echo "Copy line to clipboard"<cr>',
  { desc = 'Yank current line to clipboard' }
)

map(
  'n',
  'yl',
  '"+yy<cmd>echo "Copy line to clipboard"<cr>',
  { desc = 'Yank current line to clipboard' }
)

map(
  'n',
  'ya',
  '<cmd>%y+<cr><cmd>echo "Copy all content to clipboard"<cr>',
  { desc = 'Copy all content to clipboard' }
)

map(
  'n',
  '<leader>d',
  '^vg_"+x<esc><cmd>echo "Cut line to clipboard"<cr>',
  { desc = 'Delete to clipboard' }
)

map(
  'v',
  '<leader>d',
  '"+x<cmd>echo "Cut to clipboard"<cr>',
  { desc = 'Cut to clipboard' }
)

map(
  'n',
  '<leader>p',
  '"+gp<esc><cmd>echo "Paste from clipboard"<cr>',
  { desc = 'Paste from clipboard' }
)

map(
  'x',
  '<leader>p',
  '"_dP',
  { desc = 'Register is not changed on paste' }
)

map(
  'n',
  '<leader>P',
  'o<esc>"+gp<esc><cmd>echo "Paste from clipboard in new line"<cr>',
  { desc = 'Paste from clipboard in new line' }
)

map(
  'v',
  '<leader>p',
  'c<esc>"+gp<esc><cmd>echo "Paste from clipboard"<cr>',
  { desc = 'Paste from clipboard' }
)

map(
  'v',
  '<leader>P',
  'D"+gp<esc><cmd>echo "Paste from clipboard"<cr>',
  { desc = 'Paste from clipboard' }
)

-- Join lines and keep cursor
map('n', '<leader>j', 'mzJ`z')

-- Delete not copy
map('n', 'x', '"_x')
map('n', '<del>', '"_x')

-- Move lines
map('n', '<c-a-j>', '<cmd>m .+1<cr>')
map('n', '<c-a-k>', '<cmd>m .-2<cr>')
map('i', '<c-a-j>', '<esc><cmd>m .+1<cr>==gi')
map('i', '<c-a-k>', '<esc><cmd>m .-2<cr>==gi')
map('v', '<c-a-j>', ":m '>+1<cr>gv=gv")
map('v', '<c-a-k>', ":m '<-2<cr>gv=gv")

-- Comment line (dosen't work)
map('i', '<c-;>', "<esc><cmd>MiniComment.toggle_lines()<cr>i")

-- Clone lines
map('n', '<c-s-a-j>', 'yyp')
map('n', '<c-s-a-k>', 'yyP')
map('i', '<c-s-a-j>', '<esc>yypi')
map('i', '<c-s-a-k>', '<esc>yyPi')
map('v', '<c-s-a-j>', ":'<,'>copy '><cr>")
map('v', '<c-s-a-k>', 'ygvO<esc>P')

-- Keep cursor end select when visual copy
map('v', 'y', 'ygv<esc>')

-- Visual match pairs
map('v', '<leader>(',  'c()<esc>P')
map('v', '<leader>)',  'c()<esc>P')
map('v', '<leader>((', 'c(())<left><esc>P')
map('v', '<leader>))', 'c(())<left><esc>P')
map('v', '<leader>[',  'c[]<esc>P')
map('v', '<leader>]',  'c[]<esc>P')
map('v', '<leader>[[', 'c[[]]<left><esc>P')
map('v', '<leader>]]', 'c[[]]<left><esc>P')
map('v', '<leader>{',  'c{}<esc>P')
map('v', '<leader>}',  'c{}<esc>P')
map('v', '<leader>{{', 'c{{}}<left><esc>P')
map('v', '<leader>}}', 'c{{}}<left><esc>P')
map('v', "<leader>'",  "c''<esc>P")
map('v', '<leader>"',  'c""<esc>P')

-- Remove highlight
map({'n', 'i'}, '<esc>', '<cmd>noh<cr><esc>')
map('n', 'ç', '<cmd>noh<cr>')

-- Replace word in cursor
map('n', '<leader>R', ':%s/<c-r><c-w>//g<left><left>')

-- Replace selected
map('v', '<leader>r', '"hy:%s/<c-r>h//g<left><left>')

-- Replace select to clipboard and keep cursor
map('v', '<leader>R', ':s/<c-r><c-w>/<c-r>+/<cr>e')

-- Keep search results centred
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Stop copy in last char
map('v', 'y', 'ygv<esc>')

-- Indent
map('n', '>', '>>')
map('n', '<', '<<')
map('v', '>', '>gv')
map('v', '<', '<gv')

-- Buffer

map(
  'n',
  '<leader>n',
  '<cmd>ene<cr>',
  { desc = 'Buffer new' }
)

map(
  'n',
  '<leader>bn',
  '<cmd>ene<cr>',
  { desc = 'Buffer new' }
)

map(
  'n',
  '<leader>w',
  '<cmd>bd<cr>',
  { desc = 'Buffer delete' }
)

map(
  'n',
  '<leader>bd',
  '<cmd>bd<cr>',
  { desc = 'Buffer delete' }
)

map(
  'n',
  '<leader>bc',
  '<cmd>bd<cr>',
  { desc = 'Belete close' }
)

map(
  'n',
  '<leader>bl',
  '<cmd>bn<cr>',
  { desc = 'Buffer next' }
)

map(
  'n',
  '<leader>bn',
  '<cmd>bn<cr>',
  { desc = 'Buffer next' }
)

map(
  'n',
  '<tab>',
  '<cmd>bn<cr>',
  { desc = 'Buffer next' }
)

map(
  'n',
  '<leader>bh',
  '<cmd>bp<cr>',
  { desc = 'Buffer prev' }
)

map(
  'n',
  '<leader>bp',
  '<cmd>bp<cr>',
  { desc = 'Buffer prev' }
)

map(
  'n',
  '<s-tab>',
  '<cmd>bp<cr>',
  { desc = 'Buffer prev' }
)

map(
  'n',
  '<leader>by',
  '<cmd>%y+<cr><cmd>echo "Copy all content to clipboard"<cr>',
  { desc = 'Buffer yank' }
)

-- Split Window

map(
  'n',
  'ss',
  '<cmd>sp<cr><c-w>k<cmd>bp<cr>',
  { desc = 'Split' }
)

map(
  'n',
  'vv',
  '<cmd>vsp<cr><c-w>h<cmd>bp<cr>',
  { desc = 'Split vertical' }
)

-- Navigation panes

map(
  'n',
  '<a-h>',
  '<c-w>h',
  { desc = 'Go left window' }
)

map(
  'n',
  '<a-j>',
  '<c-w>j',
  { desc = 'Go dow window' }
)

map(
  'n',
  '<a-k>',
  '<c-w>k',
  { desc = 'Go up window' }
)

map(
  'n',
  '<a-l>',
  '<c-w>l',
  { desc = 'Go right window' }
)

-- tmux

map(
  'n',
  '<a-h>',
  '<cmd>TmuxNavigateLeft<cr>',
  { desc = 'Tmux navigate left' }
)

map(
  'n',
  '<a-j>',
  '<cmd>TmuxNavigateDown<cr>',
  { desc = 'Tmux navigate down' }
)

map(
  'n',
  '<a-k>',
  '<cmd>TmuxNavigateUp<cr>',
  { desc = 'Tmux navigate up' }
)

map(
  'n',
  '<a-l>',
  '<cmd>TmuxNavigateRight<cr>',
  { desc = 'Tmux navigate right' }
)

-- Resize Window

map(
  'n',
  '<up>',
  '<cmd>resize +2<cr>',
  { desc = 'Resize height taller' }
)

map(
  'n',
  '<down>',
  '<cmd>resize -2<cr>',
  { desc = 'Resize height shorter' }
)

map(
  'n',
  '<left>',
  '<cmd>vertical resize +2<cr>',
  { desc = 'Resize height left' }
)

map(
  'n',
  '<right>',
  '<cmd>vertical resize -2<cr>',
  { desc = 'Resize height right' }
)

-- Auto-complete

map(
  'n',
  '<c-k>',
  '<cmd>cnext<cr>zz',
  { desc = 'Next item' }
)

map(
  'n',
  '<c-j>',
  '<cmd>cprev<cr>zz',
  { desc = 'Prev item' }
)

-- Menu
map(
  'i',
  '<c-space>',
  '<c-n>',
  { desc = 'Show menu' }
)

map(
  {'i', 'c'},
  '<c-j>',
  'pumvisible() ? "\\<c-n>" : "\\<c-j>"',
  { desc = 'Next item', expr = true }
)

map(
  {'i', 'c'},
  '<c-k>',
  'pumvisible() ? "\\<c-p>" : "\\<c-k>"',
  { desc = 'Prev item', expr = true }
)

map(
  {'i', 'c'},
  '<c-c>',
  'pumvisible() ? "\\<c-e>" : "\\<c-c>"',
  { desc= "Close menu", expr = true }
)

-- In command mode (not working)
map(
  'c',
  '<c-a>',
  '<home>',
  { desc = 'Go home' }
)

map(
  'c',
  '<c-e>',
  '<end>',
  { desc = 'Go end' }
)

map(
  'n',
  '<leader>x',
  '<cmd>!chmod +x %<cr>',
  { desc = 'Make file executable' }
)

map(
  {'n', 'i', 'v'},
  '<c-s>',
  '<cmd>w!<cr><esc>',
  {
    desc = 'Save file',
    silent = false
  }
)

map(
  'n',
  '<leader>q',
  '<cmd>q<cr>',
  { desc = 'Quit' }
)

map(
  'n',
  '<leader>Q',
  '<cmd>qa!<cr>',
  { desc = 'Quit all' }
)

map(
  'n',
  '<leader>uc',
  '',
  {
    desc = 'Toggle cmd height',
    noremap = true,
    callback = function()
      if vim.o.cmdheight == 1 then
        vim.opt.cmdheight = 0
      else
        vim.opt.cmdheight = 1
      end
      print('Toggle cmdheight')
    end
  }
)

map(
  'n',
  '<leader>un',
  '',
  {
    desc = 'Toggle line number',
    noremap = true,
    callback = function()
      if vim.o.number then
        vim.opt.number = false
        vim.opt.relativenumber = false
      else
        vim.opt.number = true
        vim.opt.relativenumber = true
      end
      print('Toggle number')
    end
  }
)

map(
  'n',
  '<leader>ur',
  '',
  {
    desc = 'Toggle relative number',
    noremap = true,
    callback = function()
      if vim.o.relativenumber then
        vim.opt.relativenumber = false
      else
        vim.opt.relativenumber = true
      end
      print('Toggle relative number')
    end
  }
)

map(
  'n',
  '<leader>ul',
  '',
  {
    desc = 'Toggle list char',
    noremap = true,
    callback = function()
      if vim.o.list then
        vim.opt.list = false
      else
        vim.opt.list = true
      end
      print('Toggle list chars')
    end
  }
)

map(
  'n',
  '<leader>us',
  '',
  {
    desc = 'Toggle spell',
    noremap = true,
    callback = function()
      vim.wo.spell = not vim.wo.spell 
      print('Toggle spell')
    end
  }
)

map(
  'n',
  '<leader>uw',
  '',
  {
    desc = 'Toggle wrap',
    noremap = true,
    callback = function()
      vim.wo.wrap = not vim.wo.wrap
      print('Toggle wrap')
    end
  }
)

map(
  'n',
  '<leader>uw',
  '<cmd>WhichKey<cr>',
  { desc = 'WhichKey' }
)

------------------------------------------------------------
-- Plugins
------------------------------------------------------------

-- lazy
map('n', '<leader><leader>p', '<cmd>Lazy<cr>')

-- nvim-tree
if vim.fn.exists(':NvimTreeToggle') then
  map('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')
else
  map('n', '<leader>e', '<cmd>15Lex<cr>')
end

-- oil
map('n', '<leader>E', '<cmd>lua require("oil").toggle_float()<cr>')

-- telescope
map('n', '<c-p>',      '<cmd>Telescope file_browser<cr>')
map('n', '<leader>fa', '<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>')
map('n', '<leader>fc', '<cmd>HopChar1<cr>') -- hop
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<leader>fC', '<cmd>Telescope commands<cr>')
map('n', '<leader>ff', '<cmd>Telescope file_browser<cr>')
map('n', '<leader>fF', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope git_files<cr>')
-- map('n', '<leader>fgb', '<cmd>Telescope git_branches<cr>')
-- map('n', '<leader>fgc', '<cmd>Telescope git_commits<cr>')
-- map('n', '<leader>fgs', '<cmd>Telescope git_status<cr>')
map('n', '<leader>fh', '<cmd>Telescope highlights<cr>')
map('n', '<leader>fH', '<cmd>Telescope help_tags<cr>')
map('n', '<leader>fk', '<cmd>Telescope keymaps<cr>')
map('n', '<leader>fl', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fm', '<cmd>Telescope marks<cr>')
map('n', '<leader>ft', '<cmd>Telescope filetypes<cr>')
map('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>')
map('n', '<leader>fO', '<cmd>Telescope vim_options<cr>')
map('n', '<leader>fz', '<cmd>Telescope current_buffer_fuzzy_find<cr>')

-- zen mode
map('n', '<leader>z', '<cmd>set wrap<cr> <cmd>set linebreak<cr> <cmd>ZenMode<cr>')

-- Test snipets
-- map('i', ',i', 'if [ @ ]; then <cr><cr> else <cr><cr> fi ')
-- map('i', ',c', 'case "$@" in <cr><cr> @)    ;; <cr><cr> esac')
-- map('i', ',f', '@() {<cr><cr> } ')

-- References
-- https://github.com/NvChad
-- https://github.com/LunarVim
-- https://github.com/AstroNvim
-- https://github.com/LazyVim/LazyVim
-- https://bitbucket.org/sergio/mylazy-nvim
-- Automatically create if, case, and function templates in insert mode
-- https://stackoverflow.com/questions/18948491/running-python-code-in-vim
-- https://github.com/jdhao/nvim-config/blob/fc144e08957c39954927ae1f48ce70d8b464d258/core/mappings.lua

