--------------------------------------------------------------------------------
-- Mappings
--------------------------------------------------------------------------------

nvim_tree_auto_open = true

-- vars
local cmd = vim.cmd

-- functions
function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- leader
vim.g.mapleader = ' '

-- reload
map('n', '<leader>r', '[[<cmd>echo Reload<cr>]]') 

--! edit

-- scape
map('i', 'kj', '<esc>')
map('v', '<leader>kj', '<esc>')

-- ignore wordwrap jumpline
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- enter in normal mode
map('n', '<c-o>', 'o<esc>j')
map('n', '<c-O>', 'O<esc>k')

-- join lines
map('n', '<leader>j', 'J')

-- delete not copy
map('n', 'x', [["_x]])
map('n', '<del>', [["_x]])

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
map('n', 'M', '`m')

-- split
map('n', 'ss', '<cmd>sp<cr>')
map('n', 'vv', '<cmd>vsp<cr>')

-- jump varius lines
map('n', 'J', '5j')
map('n', 'K', '5k')
map('v', 'J', '5j')
map('v', 'K', '5k')

-- begin and end line
map('n', 'H', '^')
map('n', 'L', 'g_')
map('v', 'H', '^')
map('v', 'L', 'g_')

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
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')
map('n', '<c-h>', '<c-w>h')

-- move panels
map('n', '<c-w>h', '<c-w>H')
map('n', '<c-w>k', '<c-w>K')
map('n', '<c-w>j', '<c-w>J')
map('n', '<c-w>l', '<c-w>L')

-- resize
--map('n', '<up>', '<cmd>resize -2<cr>')
--map('n', '<down>', '<cmd>resize +2<cr>')
map('n', '<left>', '<cmd>vertical resize +2<cr>')
map('n', '<right>', '<cmd>vertical resize -2<cr>')

-- buffer
map('n', '<leader>n', '<cmd>ene<cr>')
map('n', '<leader>h', '<cmd>bp<cr>')
map('n', '<leader>l', '<cmd>bn<cr>')
map('n', '<leader>w', '<cmd>bd #<cr>')
map('n', '<a>h', '<cmd>bp<cr>')
map('n', '<a>l', '<cmd>bn<cr>')
map('n', '<a>w', '<cmd>bp \\|bd #<cr>')

-- nav
cmd[[inoremap <expr> <c-j> pumvisible() ? "\<c-n>" : "\<c-j>"]]
cmd[[inoremap <expr> <c-k> pumvisible() ? "\<c-p>" : "\<c-k>"]]

-- save
map('n', '<c-s>', '<cmd>w!<cr>')
map('i', '<c-s>', '<cmd><esc>w!<cr>')

-- quit
map('n', '<a-q>', '<cmd>q!<cr>')

--------------------------------------------------------------------------------
-- Plugins
--------------------------------------------------------------------------------

-- nvimtree
map('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')
map('n', '<c-e>', '<cmd>NvimTreeToggle<cr>')

-- packer
map('n', '<leader>pi', '<cmd>PackerInstall<cr>')
map('n', '<leader>ps', '<cmd>PackerSync<cr>')

-- telescope
map('n', '<c-p>', '<cmd>Telescope find_files<cr>')
map('n', '<leader>p', '<cmd>Telescope git_files<cr>')

-- tmux
map('n', '<c-k>', [[<cmd>lua require('tmux').move_up()<cr>]])
map('n', '<c-j>', [[<cmd>lua require('tmux').move_down()<cr>]])
map('n', '<c-h>', [[<cmd>lua require('tmux').move_left()<cr>]])
map('n', '<c-l>', [[<cmd>lua require('tmux').move_right()<cr>]])
