------------------------------------------------------------
-- Mappings
------------------------------------------------------------

-- vars
local cmd = vim.cmd

-- functions
function map(mode, lhs, rhs, opts)
	opts = opts or { silent = true }
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- leader
vim.g.mapleader = ' '

-- reload
map('n', '<leader>r', [[luafile $HOME/.config/nvim/init.lua echo "Reload"]]) 

-- scape
map('i', 'kj', '<esc>')
map('v', '<leader>kj', '<esc>')

-- navigate in insertmode
map('i', '<c-h>', '<left>')
map('i', '<c-l>', '<right>')

-- ignore wordwrap jumpline
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- like C and D
map('n', 'Y', 'y$')

-- new line in normal mode
map('n', '<leader>o', 'm`o<esc>``')
map('n', '<leader>O', 'm`O<esc>``')

-- copy
map('n', '<leader>y', 'V"+y')
map('v', '<leader>y', '"+y')

-- cut
map('n', '<leader>x', 'V"+x')
map('v', '<leader>x', '"+x')

-- paste
map('n', '<leader>p', '"+gp<esc>')
map('n', '<leader>P', 'o<esc>"+gp<esc>')

-- join lines
map('n', '<leader>j', 'J')

-- delete not copy
map('n', 'x', [["_x]])
map('n', '<del>', [["_x]])

-- move line
map('n', '<a-j>', '<cmd>m+<cr>')
map('n', '<a-k>', '<cmd>m-2<cr>')
map('v', '<a-j>', [[:m'>+<cr>`<my`>mzgv`yo`z]])
map('v', '<a-k>', [[:m'<-2<cr>`>my`<mzgv`yo`z]])

-- clone line
map('n', '<c-a-j>', 'yyp')
map('n', '<c-a-k>', 'yyP')
map('v', '<c-a-j>', [[:'<,'>copy '><cr>]])
map('v', '<c-a-k>', 'ygvO<esc>P')

-- keep cursor end select when visual copy
map('v', 'y', 'ygv<esc>')

-- remove highlight
map('n', '<esc>', '<cmd>noh<cr>')

-- keep search results centred
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', 'J', 'mzJ`z')

-- select all
map('n', '<leader>a', 'G<s-v>gg')

-- format
map('n', '<leader>f', '<cmd>retab<cr>')

-- qq to record in q, Q to play
map('n', 'Q', '@q')

-- mm to mark in m, M to jump
map('n', 'M', '`')

-- split
map('n', 'ss', '<cmd>sp<cr>')
map('n', 'vv', '<cmd>vsp<cr>')

-- jump varius lines
map('n', 'J', '5j')
map('n', 'K', '5k')
map('v', 'J', '5j')
map('v', 'K', '5k')

-- begin and end line
map('n', 'L', 'g_')
map('n', 'H', '^')
map('v', 'L', 'g_')
map('v', 'H', '^')

-- new file
map('n', '<leader>n', '<cmd>enew<cr>')

-- easy select all of file
map('n', '<leader>a', 'ggVG<c-$>')

-- stop copy in last char
map('v', 'y', 'ygv<esc>')

-- indent
map('n', '>', '>>')
map('n', '<', '<<')
map('v', '>', '>gv')
map('v', '<', '<gv')

-- navigation panels
map('n', '<c-h>', '<c-w>h')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')

-- tmux
map('n', '<c-h>', [[:lua require('tmux').move_left()<cr>]])
map('n', '<c-j>', [[:lua require('tmux').move_down()<cr>]])
map('n', '<c-k>', [[:lua require('tmux').move_up()<cr>]])
map('n', '<c-l>', [[:lua require('tmux').move_right()<cr>]])

-- move panels
map('n', '<c-w>h', '<c-w>H')
map('n', '<c-w>j', '<c-w>J')
map('n', '<c-w>k', '<c-w>K')
map('n', '<c-w>l', '<c-w>L')

-- resize
map('n', '<up>', '<cmd>resize +2<cr>')
map('n', '<down>', '<cmd>resize -2<cr>')
map('n', '<left>', '<cmd>vertical resize +2<cr>')
map('n', '<right>', '<cmd>vertical resize -2<cr>')

-- buffer
map('n', '<leader>n', '<cmd>ene<cr>')
map('n', '<leader>l', '<cmd>bn<cr>')
map('n', '<leader>h', '<cmd>bp<cr>')
map('n', '<leader>w', '<cmd>bd<cr>')
map('n', '<a-n>', '<cmd>ene<cr>')
map('n', '<a-l>', '<cmd>bn<cr>')
map('n', '<a-h>', '<cmd>bp<cr>')
map('n', '<a-w>', '<cmd>bd<cr>')

-- menu
map('i', '<c-space>', '<c-n>')
cmd[[inoremap <expr><c-j> pumvisible() ? "\<c-n>" : "\<c-j>"]]
cmd[[inoremap <expr><c-k> pumvisible() ? "\<c-p>" : "\<c-k>"]]
cmd[[inoremap <expr><c-c> pumvisible() ? "\<c-e>" : "\<c-c>"]]
cmd[[cnoremap <expr><c-j> pumvisible() ? "\<c-n>" : "\<c-j>"]]
cmd[[cnoremap <expr><c-k> pumvisible() ? "\<c-p>" : "\<c-k>"]]
cmd[[cnoremap <expr><c-c> pumvisible() ? "\<c-e>" : "\<c-c>"]]

-- save
map('n', '<c-s>', '<cmd>w!<cr>', { silent = false })
map('i', '<c-s>', '<esc><cmd>w!<cr>', { silent = false })
map('v', '<c-s>', '<esc><cmd>w!<cr>', { silent = false })

-- quit
map('n', '<leader>q', '<cmd>q!<cr>')

------------------------------------------------------------
-- Plugins
------------------------------------------------------------

-- coc
map('n', '<leader>f', '<cmd>CocCommand prettier.formatFile<cr>')

-- hop
map('n', '<leader><leader>f', '<cmd>HopChar1<cr>')

-- nvimtree
map('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')
-- map('n', '<leader>e', '<cmd>Vex<cr>')

-- packer
map('n', '<leader>pc', '<cmd>PackerCompile<cr>')
map('n', '<leader>pi', '<cmd>PackerInstall<cr>')
map('n', '<leader>ps', '<cmd>PackerSync<cr>')
map('n', '<leader>pS', '<cmd>PackerStatus<cr>')
map('n', '<leader>pu', '<cmd>PackerUpdate<cr>')

-- telescope
map('n', '<c-p>', '<cmd>Telescope find_files<cr>')
map('n', '<leader>g', '<cmd>Telescope git_files<cr>')
