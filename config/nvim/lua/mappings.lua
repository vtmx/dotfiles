------------------------------------------------------------
-- Mappings
------------------------------------------------------------

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
map('n', '<leader>r', [[luafile $HOME/.config/nvim/init.lua echo "Reload"]]) 

-- scape
map('i', 'kj', '<esc>')
map('v', '<leader>kj', '<esc>')

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
map('n', '<a-j>', ':m+<cr>')
map('n', '<a-k>', ':m-2<cr>')
map('v', '<a-j>', [[:m'>+<cr>`<my`>mzgv`yo`z]])
map('v', '<a-k>', [[:m'<-2<cr>`>my`<mzgv`yo`z]])

-- clone line
-- nnoremap <silent> <s-j> :t.<cr>
-- nnoremap <silent> <s-k> :t-<cr>
-- vnoremap <silent> <s-j> :copy '><cr>
-- vnoremap <silent> <s-k> :copy -'><cr>

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
map('n', 'L', 'g_')
map('n', 'H', '^')
map('v', 'L', 'g_')
map('v', 'H', '^')

-- new file
map('n', '<leader>n', ':enew<cr>')

-- easy select all of file
map('n', '<leader>a', 'ggVG<c-$>')

-- stop copy in last char
map('v', 'y', 'ygv<esc>')

-- indent
-- map('n', '>', '>>')
-- map('n', '<', '<<')
-- map('v', '>', '>gv')
-- map('v', '<', '<gv')
cmd[[nnoremap > >>]]
cmd[[nnoremap < <<]]
cmd[[vnoremap > >gv]]
cmd[[vnoremap < <gv]]

-- navigation panels
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')
map('n', '<c-h>', '<c-w>h')

-- tmux
map('n', '<c-k>', [[:lua require('tmux').move_up()<cr>]])
map('n', '<c-j>', [[:lua require('tmux').move_down()<cr>]])
map('n', '<c-h>', [[:lua require('tmux').move_left()<cr>]])
map('n', '<c-l>', [[:lua require('tmux').move_right()<cr>]])

-- move panels
map('n', '<c-w>h', '<c-w>H')
map('n', '<c-w>k', '<c-w>K')
map('n', '<c-w>j', '<c-w>J')
map('n', '<c-w>l', '<c-w>L')

-- resize
map('n', '<up>', ':resize +2<cr>')
map('n', '<down>', ':resize -2<cr>')
map('n', '<left>', ':vertical resize +2<cr>')
map('n', '<right>', ':vertical resize -2<cr>')

-- buffer
map('n', '<leader>n', ':ene<cr>')
map('n', '<leader>h', ':bp<cr>')
map('n', '<leader>l', ':bn<cr>')
cmd[[nnoremap <silent> <leader>w :bp \|bd #<cr>]]
cmd[[nnoremap <silent> <a-n> :ene<cr>]]
cmd[[nnoremap <silent> <a-l> :bn<cr>]]
cmd[[nnoremap <silent> <a-h> :bp<cr>]]
cmd[[nnoremap <silent> <a-w> :bp \|bd #<cr>]]

-- nav
-- map('i', '<expr> <c-j>', 'pumvisible() ? "\\<c-n>" : "\\<c-j>"')
-- map('i', '<expr> <c-k>', 'pumvisible() ? "\\<c-p>" : "\\<c-j>"')
cmd[[inoremap <expr><c-j> pumvisible() ? "\<c-n>" : "\<c-j>"]]
cmd[[inoremap <expr><c-k> pumvisible() ? "\<c-p>" : "\<c-k>"]]

-- save
map('n', '<c-s>', ':w!<cr>', { noremap = true, silent = false })
map('i', '<c-s>', '<esc>:w!<cr>', { noremap = true, silent = false })
map('v', '<c-s>', '<esc>:w!<cr>', { noremap = true, silent = false })

-- quit
map('n', '<a-q>', ':q!<cr>')

------------------------------------------------------------
-- Plugins
------------------------------------------------------------

-- coc
map('n', '<leader>f', ':CocCommand prettier.formatFile<cr>')

-- hop
map('n', '<leader><leader>f', ':HopChar1<cr>')

-- nvimtree
map('n', '<leader>e', ':NvimTreeToggle<cr>')
map('n', '<c-e>', ':NvimTreeToggle<cr>')

-- packer
-- map('n', '<leader>pi', ':PackerInstall<cr>')
-- map('n', '<leader>ps', ':PackerSync<cr>')

-- telescope
map('n', '<c-p>', ':Telescope find_files<cr>')
map('n', '<leader>g', ':Telescope git_files<cr>')

