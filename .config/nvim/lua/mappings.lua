--------------------------------------------------------------------------------
-- Mappings
--------------------------------------------------------------------------------

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
map('n', '<leader>r', ':echo "Reload"<cr>') 

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
map('n', 'x', '"_x')
map('n', '<del>', '"_x')

-- keep cursor end select when visual copy
map('v', 'y', 'ygv<esc>')

-- remove highlight
map('n', '<esc>', ':noh<cr>')

-- keep search results centred
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', 'J', 'mzJ`z')

-- select all
map('n', '<leader>a', 'G<s-v>gg')

-- format
map('n', '<leader>f', ':retab<cr>')

-- qq to record in q, Q to play
map('n', 'Q', '@q')

-- mm to mark in m, M to jump
map('n', 'M', '`m')

-- split
map('n', 'ss', ':sp<cr>')
map('n', 'vv', ':vsp<cr>')

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
map('n', '<leader>n', ':enew<cr>')

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

-- move panels
map('n', '<c-w>h', '<c-w>H')
map('n', '<c-w>j', '<c-w>J')
map('n', '<c-w>k', '<c-w>K')
map('n', '<c-w>l', '<c-w>L')

-- resize
--map('n', '<up>', ':resize -2<cr>')
--map('n', '<down>', ':resize +2<cr>')
map('n', '<left>', ':vertical resize +2<cr>')
map('n', '<right>', ':vertical resize -2<cr>')

-- buffer
map('n', '<leader>n', ':ene<cr>')
map('n', '<leader>h', ':bp<cr>')
map('n', '<leader>l', ':bn<cr>')
map('n', '<leader>w', ':bp \\|bd #<cr>')
map('n', '<a>h', ':bp<cr>')
map('n', '<a>l', ':bn<cr>')
map('n', '<a>w', ':bp \\|bd #<cr>')

-- nav
cmd('inoremap <expr> <c-j> (\'\\<c-n>\')')
cmd('inoremap <expr> <c-k> (\'\\<c-p>\')')

-- save
map('n', '<c-s>', ':w!<cr>')
map('i', '<c-s>', ':<esc>w!<cr>')

-- quit
map('n', '<a-q>', ':q!<cr>')

--------------------------------------------------------------------------------
-- Plugins
--------------------------------------------------------------------------------
