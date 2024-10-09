local utils = require('config.utils')
local map = vim.keymap.set
vim.g.mapleader = ' '

-- Normal

map(
  'n', 'ç', '<cmd>noh<cr>',
  { desc = 'Remove highlight' }
)

map(
  'x', 'c', '"_c',
  { desc = 'Change text without putting it into register' }
)

map(
  'n', 'k', 'gk',
  { desc = 'Ignore wordwrap jumpline' }
)

map(
  {'n', 'v'}, 'H', '^',
  { desc = 'Go to begin line' }
)

map(
  'n', 'j', 'gj',
  { desc = 'Ignore wordwrap jumpline' }
)

map(
  {'n', 'v' }, 'J', '5j',
  { desc = 'Jump 5 line to down' }
)

map(
  {'n', 'v'}, 'K', '5k',
  { desc = 'Jump 5 line to up' }
)

map(
  {'n', 'v'}, 'L', 'g_',
  { desc = 'Go to end line' }
)

map(
  'n', 'm', '`',
  { desc = 'Go to mark' }
)

map(
  'n', 'M', 'm',
  { desc = 'Create mark' }
)

map(
  'n', 's', '<cmd>HopChar1<cr>',
  { desc = 'Char' }
)

map(
  'n', 'ss', '<cmd>sp<cr><c-w>k<cmd>bp<cr>',
  { desc = 'Split' }
)

map(
  'n', 'U', '<c-r>',
  { desc = 'Redo' }
)

map(
  'n', 'vv', '<cmd>vsp<cr><c-w>h<cmd>bp<cr>',
  { desc = 'Split vertical' }
)

map(
  'n', 'ya', '<cmd>%y+<cr><cmd>echo "Copy all content to clipboard"<cr>',
  { desc = 'Copy all content to clipboard' }
)

map(
  'n', 'yl', '"+yy<cmd>echo "Copy line to clipboard"<cr>',
  { desc = 'Yank current line to clipboard' }
)

map(
  'n', '<esc>', '<cmd>noh<cr><esc>',
  { desc = 'Remove highlight' }
)

map(
  'n', '>', '>>',
  { desc = 'Add indent' }
)

map(
  'n', '<', '<<',
  { desc = 'Remove indent' }
)

map(
  'n', '<f1>', function() local word = vim.fn.expand('<cword>') vim.cmd('help ' .. word) end,
  { desc = 'Help for current word' }
)

map(
  'n', '<c-w>-', '<cmd>resize +10<cr>',
  { desc = 'Resize height taller' }
)

map(
  'n', '<c-w>=', '<cmd>resize -10<cr>',
  { desc = 'Resize height shorter' }
)

map(
  'n', '<c-w><', '<cmd>vertical resize -15<cr>',
  { desc = 'Resize height left' }
)

map(
  'n', '<c-w>>', '<cmd>vertical resize +15<cr>',
  { desc = 'Resize height right' }
)

map(
  'n', '<tab>', '<cmd>bn<cr>',
  { desc = 'Buffer next' }
)

map(
  'n', '<s-tab>', '<cmd>bp<cr>',
  { desc = 'Buffer prev' }
)

map(
  'n', '<c-p>', '<cmd>Telescope git_files<cr>',
  { desc = 'Files' }
)

map(
  'n', '<c-s>', '<cmd>w<cr>',
  { desc = 'Save file if file is change', silent = false }
)

map(
  'n', '<c-a-j>', '<cmd>m .+1<cr>',
  { desc = 'Move line to down' }
)

map(
  'n', '<c-a-k>', '<cmd>m .-2<cr>',
  { desc = 'Move line to up' }
)

map(
  'n', '<a-l>', '<cmd>TmuxNavigateLeft<cr>',
  { desc = 'TmuxNavigateLeft' }
)

map(
  'n', '<a-h>', '<cmd>TmuxNavigateRight<cr>',
  { desc = 'TmuxNavigateRight' }
)

map(
  'n', '<a-j>', '<cmd>TmuxNavigateDown<cr>',
  { desc = 'TmuxNavigateDown' }
)

map(
  'n', '<a-k>', '<cmd>TmuxNavigateUp<cr>',
  { desc = 'TmuxNavigateUp' }
)

-- Insert

map(
  'i', 'kj', '<esc>',
  { desc = 'Return to normal mode' }
)

map(
  'i', '<c-h>', '<left>',
  { desc = 'Go left in insert mode' }
)

map(
  'i', '<c-l>', '<right>',
  { desc = 'Go right in insert mode' }
)

map(
  'i', '<c-s>', '<cmd>up!<cr><esc>',
  { desc = 'Save file if file is change', silent = false }
)

map(
  'i', '<c-,>', '```bash<cr>```<esc>O',
  { desc = 'Add bash code' }
)

map(
  'i', '<c-;>', '<esc>:normal gcc<cr>i',
  { desc = 'Comment line' }
)

-- Visual

map(
  'v', 'ç', '<esc>',
  { desc = 'Return to normal mode' }
)

map(
  'v', 'y', 'ygv<esc>',
  { desc = 'Keep cursor end select when visual copy' }
)

map(
  'v', "'", '"',
  { desc = 'Create register' }
)

map(
  'v', '>', '>gv',
  { desc = 'Add indent' }
)

map(
  'v', '<', '<gv',
  { desc = 'Remove indent' }
)

map(
  'v', '<c-a-j>', ":m '>+1<cr>gv=gv",
  { desc = 'Move select line(s) to down' }
)

map(
  'v', '<c-a-k>', ":m '<-2<cr>gv=gv",
  { desc = 'Move select line(s) to up' }
)

-- Command

map(
  'c', '<c-a>', '<home>',
  { desc = 'Beginner of line' }
)

map(
  'c', '<c-e>', '<end>',
  { desc = 'End of line' }
)

-- Leader

map(
  'n', '<leader>a', 'G<s-v>gg',
  { desc = 'Select all text' }
)

map(
  'n', '<leader>bd', '<cmd>bd<cr>',
  { desc = 'Buffer delete' }
)

map(
  'n', '<leader>bD', '<cmd>%bd|e#<cr><cmd>bn<cr><cmd>bd<cr>',
  { desc = 'Delete all buffers' }
)

map(
  'n', '<leader>bn', '<cmd>bn<cr>',
  { desc = 'Buffer next' }
)

map(
  'n', '<leader>bp', '<cmd>bp<cr>',
  { desc = 'Buffer prev' }
)

map(
  'n', '<leader>bo', '<cmd>BufOnly<cr>',
  { desc = 'Keep just current buffer' }
)

map(
  'n', '<leader>bu', function() vim.cmd('update') end,
  { desc = 'Buffer :update' }
)

map(
  'n', '<leader>d', '^vg_"+x<esc><cmd>echo "Cut line to clipboard"<cr>',
  { desc = 'Cut to clipboard' }
)

map(
  'v', '<leader>d', '"+x<cmd>echo "Cut to clipboard"<cr>',
  { desc = 'Cut to clipboard' }
)

map(
  'n', '<leader>e', '<cmd>Ex<cr>',
  { desc = 'Netrw' }
)

map(
  'n', '<leader>E', '<cmd>lua require("oil").toggle_float()<cr>',
  { desc = 'Oil' }
)

map(
  'n', '<leader>fa', '<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>',
  { desc = 'Files with hidden' }
)

map(
  'n', '<leader>fb', '<cmd>Telescope buffers<cr>',
  { desc = 'Buffers' }
)

map(
  'n', '<leader>fc', '<cmd>HopChar1<cr>',
  { desc = 'Char' }
)

map(
  'n', '<leader>fC', '<cmd>Telescope commands<cr>',
  { desc = 'Commands' }
)

map(
  'n', '<leader>ff', '<cmd>Telescope file_browser<cr>',
  { desc = 'Files browser' }
)

map(
  'n', '<leader>fF', '<cmd>Telescope find_files<cr>',
  { desc = 'Files' }
)

map(
  'n', '<leader>fg', '<cmd>Telescope git_files<cr>',
  { desc = 'Git files' }
)

map(
  'n', '<leader>fgb', '<cmd>Telescope git_branches<cr>',
  { desc = 'Git branches' }
)

map(
  'n', '<leader>fgc', '<cmd>Telescope git_commits<cr>',
  { desc = 'Git commits' }
)

map(
  'n', '<leader>fgs', '<cmd>Telescope git_status<cr>',
  { desc = 'Git status' }
)

map(
  'n', '<leader>fh', '<cmd>Telescope highlights<cr>',
  { desc = 'Highlights' }
)

map(
  'n', '<leader>fH', '<cmd>Telescope help_tags<cr>',
  { desc = 'Help' }
)

map(
  'n', '<leader>fj', '<cmd>Telescope jumplist<cr>',
  { desc = 'Jump list' }
)

map(
  'n', '<leader>fk', '<cmd>Telescope keymaps<cr>',
  { desc = 'Keymaps' }
)

map(
  'n', '<leader>fl', '<cmd>Telescope live_grep<cr>',
  { desc = 'Live grep' }
)

map(
  'n', '<leader>fm', function() vim.lsp.buf.format { async = true } end,
  { desc = 'LSP formatting' }
)

map(
  'n', '<leader>fM', '<cmd>Telescope marks<cr>',
  { desc = 'Marks' }
)

map(
  'n', '<leader>fo', '<cmd>Telescope oldfiles<cr>',
  { desc = 'Old files' }
)

map(
  'n', '<leader>fO', '<cmd>Telescope vim_options<cr>',
  { desc = 'Options' }
)

map(
  'n', '<leader>ft', '<cmd>Telescope filetypes<cr>',
  { desc = 'File types' }
)

map(
  'n', '<leader>j', 'mzJ`z',
  { desc = 'Join lines' }
)

map(
  'n', '<leader>fz', '<cmd>Telescope current_buffer_fuzzy_find<cr>',
  { desc = 'Fuzzy' }
)

map(
  'n', '<leader>n', '<cmd>ene<cr>',
  { desc = 'Buffer new' }
)

map(
  'n', '<leader>o', 'm`o<esc>``',
  { desc = 'Add new line bottom in normal mode' }
)

map(
  'n', '<leader>O', 'm`O<esc>``',
  { desc = 'Add new line up in normal mode' }
)

map(
  'n', '<leader>p', '"+gp<esc><cmd>echo "Paste from clipboard"<cr>',
  { desc = 'Paste from clipboard' }
)

map(
  'v', '<leader>p', 'c<esc>"+gp<esc><cmd>echo "Paste from clipboard"<cr>',
  { desc = 'Paste from clipboard' }
)

map(
  'n', '<leader>P', 'o<esc>"+gp<esc><cmd>echo "Paste from clipboard in new line"<cr>',
  { desc = 'Paste from clipboard in new line' }
)

map(
  'v', '<leader>P', 'D"+gp<esc><cmd>echo "Paste from clipboard"<cr>',
  { desc = 'Paste from clipboard' }
)

map(
  'n', '<leader>q', '<cmd>q<cr>',
  { desc = 'Quit' }
)

map(
  'n', '<leader>Q', '<cmd>qa!<cr>',
  { desc = 'Quit all' }
)

map(
  'n', '<leader>r', '<cmd>w<cr><cmd>so<cr><cmd>echo "source" bufname("%")<cr>',
  { desc = 'Reload config file' }
)

map(
  'n', '<leader>s', ':%s/<C-r><C-w>//g<Left><Left>',
  { desc = 'Substitute current word' }
)

map(
  'n', '<leader>S', ':%s/<C-r><C-w>/<c-r>+/g<Left><Left>',
  { desc = 'Substitute current word to clipboard' }
)

map(
  'v', '<leader>s', '"hy:%s/<c-r>h//g<left><left>',
  { desc = 'Substitute selected word' }
)

map(
  'v', '<leader>S', '"hy:%s/<c-r><c-w>/<c-r>+/g<left><left>',
  { desc = 'Substitute selected word to clipboard' }
)

map(
  'n', '<leader>ui', function() utils.toggle_ia() end,
  { desc = 'Toggle ia' }
)

map(
  'n', '<leader>ul', function() utils.toggle_listchars() end,
  { desc = 'Toggle listchars' }
)

map(
  'n', '<leader>uk', '<cmd>WhichKey<cr>',
  { desc = 'Active whichkey' }
)

map(
  'n', '<leader>un', function() utils.toggle_number() end,
  { desc = 'Toggle line number', }
)

map(
  'n', '<leader>ur', function() utils.toggle_relativenumber() end,
  { desc = 'Toggle relativenumber', }
)

map(
  'n', '<leader>us', function() utils.toggle_spell() end,
  { desc = 'Toggle spell' }
)

map(
  'n', '<leader>uw', function() utils.toggle_wrap() end,
  { desc = 'Toggle wrap' }
)

map(
  'n', '<leader>W', '<cmd>w !sudo -S tee %<cr>',
  { desc = 'Save file with sudo', silent = false }
)

map(
  'n', '<leader>x', '<cmd>w !bash<cr>',
  { desc = 'Execute current line' }
)

map(
  'n', '<leader>X', '<cmd>!bash %<cr>',
  { desc = 'Execute file' }
)

map(
  'n', '<leader>!x', '<cmd>!chmod +x %<cr>',
  { desc = 'Make file executable' }
)

map(
  'v', '<leader>x', "<cmd>w !bash<cr>",
  { desc = 'Execute selected line' }
)

map(
  'n', '<leader>y', '"+yy<cmd>echo "Copy line to clipboard"<cr>',
  { desc = 'Copy line to clipboard' }
)

map(
  'v', '<leader>y', '"+ygv<esc><cmd>echo "Copy to clipboard"<cr>',
  { desc = 'Copy to clipboard' }
) 

map(
  'n', '<leader>z', '<cmd>ZenMode<cr>',
  { desc = 'ZenMode' }
)

map(
  'n', '<leader><leader>e', '<cmd>15Lex<cr>',
  { desc = 'Lex' }
)

map(
  'n', '<leader><leader>p', '<cmd>Lazy<cr>',
  { desc = 'Lazy' }
)

map(
  'n', '<leader><leader>t', '<cmd>InspectTree<cr>',
  { desc = 'Inspect Tree' }
)
