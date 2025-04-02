local utils = require('config.utils')
local map = vim.keymap.set

-- Normal

map(
  'n', 'ç', '<cmd>nohl<cr>',
  { desc = 'Remove highlight' }
)

map(
  'x', 'c', '"_c',
  { desc = 'Change text without putting it into register' }
)

map(
  'n', 'dl', '"+dd<cmd>echo "Cut line to clipboard"<cr>',
  { desc = 'Cut current line to clipboard' }
)

map(
  'n', 'gco', 'o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>',
  { desc = 'Add a comment below current line' }
)

map(
  'n', 'gcO', 'O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>',
  { desc = 'Add a comment above current line' }
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
  'n', 'k', 'gk',
  { desc = 'Ignore wordwrap jumpline' }
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
  'n', 'yc', 'yypk:normal gcc<cr>j$',
  { desc = 'Duplicate line and comment' }
)

map(
  'n', 'yl', '"+yy<cmd>echo "Copy line to clipboard"<cr>',
  { desc = 'Yank current line to clipboard' }
)

map(
  'n', 'y%', '<cmd>%y+<cr><cmd>echo "Copy all content to clipboard"<cr>',
  { desc = 'Copy all content to clipboard' }
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
  'n', '<tab>', '<cmd>bn<cr>',
  { desc = 'Buffer next' }
)

map(
  'n', '<s-tab>', '<cmd>bp<cr>',
  { desc = 'Buffer prev' }
)

map(
  'n', '<c-l>', '<cmd>nohl<cr>',
  { desc = 'Remove highlight' }
)

map(
  {'n', 'i', 's', 'x'}, '<c-s>', '<cmd>w<cr><esc>',
  { desc = 'Save file if file is change' }
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

map(
  'n', '<a-l>', '<cmd>TmuxNavigateLeft<cr>',
  { desc = 'TmuxNavigateLeft' }
)

-- Insert

map(
  'i', 'kj', '<esc>',
  { desc = 'Return to normal mode' }
)

map(
  'i', '<c-a>', '<esc><cmd>normal ^<cr>i',
  { desc = 'Move to begin line' }
)

map(
  'i', '<c-e>', '<esc><cmd>normal $<cr>a',
  { desc = 'Move to end line' }
)

map(
  'i', '<c-h>', '<left>',
  { desc = 'Move cursor char left' }
)

map(
  'i', '<c-l>', '<right>',
  { desc = 'Move cursor char right' }
)

map(
  'i', '<c-,>', '```bash<cr>```<esc>O',
  { desc = 'Add bash code' }
)

map(
  'i', '<c-;>', '<esc><cmd>normal Ax<cr><esc><cmd>normal gcc<cr>A<bs><bs>',
  { desc = 'Comment line' }
)

map(
  'i', '<c-space>', '<c-n>',
  { desc = 'Show menu' }
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
  'v', '>', '>gv',
  { desc = 'Add indent' }
)

map(
  'v', '<', '<gv',
  { desc = 'Remove indent' }
)

map(
  'v', ';', '<esc>',
  { desc = 'Return to normal mode' }
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

map(
  {'i', 'c'}, '<c-j>', 'pumvisible() ? "\\<c-n>" : "\\<c-j>"',
  { desc = 'Next item', expr = true }
)

map(
  {'i', 'c'}, '<c-k>', 'pumvisible() ? "\\<c-p>" : "\\<c-k>"',
  { desc = 'Prev item', expr = true }
)

-- Terminal

map(
  't', '<c-w>N', '<c-\\><c-n>',
  { desc = 'Return normal mode in terminal' }
)

-- Leader

map(
  'n', '<leader>a', 'G<s-v>gg',
  { desc = 'Select all text' }
)

map(
  'n', '<leader>b', '<cmd>Telescope buffers<cr>',
  { desc = 'Buffers' }
)

map(
  'n', '<leader>c', '<cmd>HopChar1<cr>',
  { desc = 'Char' }
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
  'n', '<leader>e', function() utils.toggle_netrw_ex() end,
  { desc = 'Toggle Netrw Ex' }
)

map(
  'n', '<leader>E', function() utils.toggle_netrw_lex() end,
  { desc = 'Toggle Netrw Lex' }
)

map(
  'n', '<leader>f', '<cmd>Telescope file_browser<cr>',
  { desc = 'Files browser' }
)

map(
  'n', '<leader>g', '<cmd>Telescope git_files<cr>',
  { desc = 'Git files' }
)

map(
  'n', '<leader>h', '<cmd>Telescope highlights<cr>',
  { desc = 'Highlights' }
)

map(
  'n', '<leader>H', '<cmd>Telescope help_tags<cr>',
  { desc = 'Help' }
)

map(
  'n', '<leader>i', '<cmd>Inspect<cr>',
  { desc = 'Inspect' }
)

map(
  'n', '<leader>I', '<cmd>InspectTree<cr>',
  { desc = 'Inspect Tree' }
)

map(
  'n', '<leader>j', 'mzJ`z',
  { desc = 'Join lines' }
)

map(
  'n', '<leader>J', '<cmd>Telescope jumplist<cr>',
  { desc = 'Jump list' }
)

map(
  'n', '<leader>k', '<cmd>Telescope keymaps<cr>',
  { desc = 'Keymaps' }
)

map(
  'n', '<leader>l', '<cmd>Lazy<cr>',
  { desc = 'Lazy' }
)

map(
  'n', '<leader>m', '<cmd>Telescope marks<cr>',
  { desc = 'Marks' }
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
  'n', '<leader>O', 'm`O<esc>``k',
  { desc = 'Add new line up in normal mode' }
)

map(
  {'n', 'v'}, '<leader>p', '"+gp<esc><cmd>echo "Paste from clipboard"<cr>',
  { desc = 'Paste from clipboard' }
)

map(
  'n', '<leader>P', '"+gP<esc><cmd>echo "Paste from clipboard"<cr>',
  { desc = 'Paste from clipboard' }
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
  'n', '<leader>t', '<cmd>below term<cr>',
  { desc = 'Open terminal' }
)

map(
  'n', '<leader>T', '<cmd>vert term<cr>',
  { desc = 'Open vertical terminal' }
)

map(
  'n', '<leader>uc', function() utils.toggle_colorcolumn() end,
  { desc = 'Toggle colorcolumn' }
)

map(
  'n', '<leader>ui', function() utils.toggle_ia() end,
  { desc = 'Toggle ia' }
)

map(
  'n', '<leader>uk', '<cmd>WhichKey<cr>',
  { desc = 'Active whichkey' }
)

map(
  'n', '<leader>ul', function() utils.toggle_listchars() end,
  { desc = 'Toggle listchars' }
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
  'n', '<leader>us', function() utils.toggle_spelllang() end,
  { desc = 'Toggle spelllang' }
)

map(
  'n', '<leader>uw', function() utils.toggle_wrap() end,
  { desc = 'Toggle wrap' }
)

map(
  'n', '<leader>uz', function() utils.toggle_diary() end,
  { desc = 'Toggle diary mode' }
)

map(
  'n', '<leader>W', '<cmd>w !sudo -S tee %<cr>',
  { desc = 'Save file with sudo', silent = false }
)

map(
  'n', '<leader>x', '<cmd>.w !bash<cr>',
  { desc = 'Execute current line' }
)

map(
  'n', '<leader>X', '<cmd>%w !bash %<cr>',
  { desc = 'Execute file' }
)

map(
  'v', '<leader>x', ":'<,'>w !bash<cr>",
  { desc = 'Execute selected line(s)' }
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
  'n', '<leader>!', '<cmd>w !chmod +x %<cr>',
  { desc = 'Make file executable' }
)

map(
  'n', '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find<cr>',
  { desc = 'Fuzzy' }
)

-- Leader leader

map(
  'n', '<leader><leader>e', '<cmd>lua require("oil").toggle_float()<cr>',
  { desc = 'Oil' }
)

map(
  'n', '<leader><leader>p', 'o<esc>"+gp<esc><cmd>echo "Paste from clipboard in new line"<cr>',
  { desc = 'Paste from clipboard in new line' }
)

map(
  'n', '<leader><leader>P', 'O<esc>"+gp<esc><cmd>echo "Paste from clipboard in new line"<cr>',
  { desc = 'Paste from clipboard in new line' }
)
