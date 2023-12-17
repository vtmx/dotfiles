-- Function for mapping
local function map(mode, lhs, rhs, opts)
  local opts = opts or { silent = true }
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Leader key
vim.g.mapleader = ' '

-- Reload file
map('n', '<leader>r', '<cmd>w<cr><cmd>so<cr><cmd>echo "source" bufname("%")<cr>')

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
map('n', '<leader>a', 'G<s-v>gg')
map('n', '%', 'G<s-v>gg')

-- Redo
map('n', 'U', '<c-r>')

-- Mark
map('n', 'm', '`')
map('n', 'M', 'm')

-- Register
map('n', "'", '"')
map('v', "'", '"')

-- Yankie to clipboard
map('n', '<leader>y', 'V"+y<cmd>echo "Copy line to clipboard"<cr>')
map('v', '<leader>y', '"+ygv<esc><cmd>echo "Copy to clipboard"<cr>')

-- Yankie all to clipboard
map('n', '<leader>ya', 'G<s-v>gg"+y<c-o><c-o><cmd>echo "Copy all content to clipboard"<cr>')

-- Delete to clipboard
map('n', '<leader>d', '^vg_"+x<esc><cmd>echo "Cut line to clipboard"<cr>')
map('v', '<leader>d', '"+x<cmd>echo "Cut to clipboard"<cr>')

-- Paste to clipboard
map('n', '<leader>p', '"+gp<esc><cmd>echo "Paste from clipboard"<cr>')
map('n', '<leader>P', 'o<esc>"+gp<esc><cmd>echo "Paste from clipboard in new line"<cr>')
map('v', '<leader>p', 'c<esc>"+gp<esc><cmd>echo "Paste from clipboard"<cr>')
map('v', '<leader>P', 'D"+gp<esc><cmd>echo "Paste from clipboard"<cr>')

-- Replace select to clipboard :(
-- map('v', 'r', '"0p')

-- Join lines
map('n', '<leader>j', 'J')

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

-- Replace word
map('n', '<leader>s', [[:%s/<c-r><c-w>//g<left><left>]])

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
map('n', '<leader>n', '<cmd>ene<cr>')
map('n', '<leader>bn', '<cmd>ene<cr>')

map('n', '<leader>bd', '<cmd>bd<cr>')
map('n', '<leader>bc', '<cmd>bd<cr>')

map('n', '<leader>l', '<cmd>bn<cr>')
map('n', '<leader>bl', '<cmd>bn<cr>')
map('n', '<leader>bn', '<cmd>bn<cr>')
map('n', '<tab>', '<cmd>bn<cr>')

map('n', '<leader>h', '<cmd>bp<cr>')
map('n', '<leader>bh', '<cmd>bp<cr>')
map('n', '<leader>bp', '<cmd>bp<cr>')
map('n', '<s-tab>', '<cmd>bn<cr>')

-- Split pane
map('n', 'ss', '<cmd>sp<cr><c-w>k<cmd>bp<cr>')
map('n', 'vv', '<cmd>vsp<cr><c-w>h<cmd>bp<cr>')

-- Navigation panes
map('n', '<c-h>', '<c-w>h')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')

-- Resize panes
map('n', '<up>', '<cmd>resize +2<cr>')
map('n', '<down>', '<cmd>resize -2<cr>')
map('n', '<left>', '<cmd>vertical resize +2<cr>')
map('n', '<right>', '<cmd>vertical resize -2<cr>')

-- Next and prev auto-complete
map('n', '<c-k>', '<cmd>cnext<cr>zz')
map('n', '<c-j>', '<cmd>cprev<cr>zz')

-- Menu
map('i', '<c-space>', '<c-n>')
map({'i', 'c'}, '<c-j>', 'pumvisible() ? "\\<c-n>" : "\\<c-j>"', { expr = true })
map({'i', 'c'}, '<c-k>', 'pumvisible() ? "\\<c-p>" : "\\<c-k>"', { expr = true })
map({'i', 'c'}, '<c-c>', 'pumvisible() ? "\\<c-e>" : "\\<c-c>"', { expr = true })

-- In command mode (not working)
map('c', '<c-a>', '<home>')
map('c', '<c-e>', '<end>')

-- Make exec
map('n', '<leader>x', '<cmd>!chmod +x %<cr>')

-- Save
map({'n', 'i', 'v'}, '<c-s>', '<cmd>w!<cr><esc>', { silent = false })

-- Quit and quit all
map('n', '<leader>q', '<cmd>q<cr>')
map('n', '<leader>Q', '<cmd>qa!<cr>')

-- Toggle cmd height
map('n', '<leader>uc', '', {
  noremap = true,
  callback = function()
    if vim.o.cmdheight == 1 then
      vim.opt.cmdheight = 0
    else
      vim.opt.cmdheight = 1
    end
    print('Toggle cmdheight')
  end
})

-- Toggle number
map('n', '<leader>un', '', {
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
})

-- Toggle relative number
map('n', '<leader>ur', '', {
  noremap = true,
  callback = function()
    if vim.o.relativenumber then
      vim.opt.relativenumber = false
    else
      vim.opt.relativenumber = true
    end
    print('Toggle relative number')
  end
})

-- Toggle list chars
map('n', '<leader>ul', '', {
  noremap = true,
  callback = function()
    if vim.o.list then
      vim.opt.list = false
    else
      vim.opt.list = true
    end
    print('Toggle list chars')
  end
})

-- Toggle spell
map('n', '<leader>us', '', {
  noremap = true,
  callback = function()
    vim.wo.spell = not vim.wo.spell 
    print('Toggle spell')
  end
})

-- Toggle wrap
map('n', '<leader>uw', '', {
  noremap = true,
  callback = function()
    vim.wo.wrap = not vim.wo.wrap
    print('Toggle wrap')
  end
})

------------------------------------------------------------
-- Plugins
------------------------------------------------------------

-- hop
map('n', '<leader>fc', '<cmd>HopChar1<cr>')

-- lazy
map('n', '<leader><leader>p', '<cmd>Lazy<cr>')

-- nvim-tree
map('n', '<leader>e', '<cmd>Lex<cr>')
-- if vim.fn.exists(":NvimTreeToggle") ~= 0 then
--   map('n', '<leader>e', '<cmd>Lex<cr>')
-- else
--   map('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')
-- end

-- telescope
map('n', '<c-p>',      '<cmd>Telescope file_browser<cr>')
map('n', '<leader>fa', '<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>')
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<leader>fC', '<cmd>Telescope commands<cr>')
map('n', '<leader>ff', '<cmd>Telescope file_browser<cr>')
map('n', '<leader>fF', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope git_files<cr>')
map('n', '<leader>fgb', '<cmd>Telescope git_branches<cr>')
map('n', '<leader>fgc', '<cmd>Telescope git_commits<cr>')
map('n', '<leader>fgs', '<cmd>Telescope git_status<cr>')
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

-- tmux
map('n', '<a-h>', '<cmd>lua require("tmux").move_left()<cr>')
map('n', '<a-j>', '<cmd>lua require("tmux").move_down()<cr>')
map('n', '<a-k>', '<cmd>lua require("tmux").move_up()<cr>')
map('n', '<a-l>', '<cmd>lua require("tmux").move_right()<cr>')

-- References
-- https://github.com/AstroNvim
-- https://github.com/LazyVim/LazyVim
-- https://github.com/LunarVim
-- https://github.com/NvChad
-- https://stackoverflow.com/questions/18948491/running-python-code-in-vim
-- https://github.com/jdhao/nvim-config/blob/fc144e08957c39954927ae1f48ce70d8b464d258/core/mappings.lua
