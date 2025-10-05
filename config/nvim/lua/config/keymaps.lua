local utils = require('config.utils')
local map = vim.keymap.set

-- Normal

map(
  'n', 'ç', ':',
  { desc = 'Enter in command mode' }
)

map(
  'x', 'c', '"_c',
  { desc = 'Change text without putting it into register' }
)

map(
  'n', 'dl', '"+dd<cmd>:lua vim.notify("Cut line to clipboard", "info", { title = "Clipboard" })<cr>',
  { desc = 'Cut current line to clipboard' }
)

map(
  'n', 'gcd', 'yypk:normal gcc<cr>j$',
  { desc = 'Duplicate line and comment' }
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
  'n', 'gd', vim.lsp.buf.definition,
  { desc = 'Go to definition' }
)

map(
  { 'n', 'v' }, 'H', '^',
  { desc = 'Go to begin line' }
)

map(
  'n', 'j', 'v:count == 0 ? "gj" : "j"',
  { expr = true, desc = 'Ignore wordwrap jumpline' }
)

map(
  'n', 'J', 'mzJ`z',
  { desc = 'Join lines' }
)

map(
  'n', 'k', 'v:count == 0 ? "gk" : "k"',
  { expr = true, desc = 'Ignore wordwrap jumpline' }
)

map(
  'n', 'K',vim.lsp.buf.hover,
  { desc = 'Hover documentation' }
)

map(
  { 'n', 'v' }, 'L', 'g_',
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
  'n', 'U', '<c-r>',
  { desc = 'Redo' }
)

map(
  'n', 'vv', '<cmd>vsp<cr><c-w>h<cmd>bp<cr>',
  { desc = 'Split vertical' }
)

map(
  'n', 'yl', '"+yy<cmd>:lua vim.notify("Copy line to clipboard", "info", { title = "Clipboard" })<cr>',
  { desc = 'Yank current line to clipboard' }
)

map(
  'n', 'y%', '<cmd>%y+<cr><cmd>:lua vim.notify("Copy all content to clipboard", "info", { title = "Clipboard" })<cr>',
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
  { 'n', 'i', 's', 'x' }, '<c-s>', '<cmd>w<cr><esc>',
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
  'n', '<a-h>', '<cmd>TmuxNavigateLeft<cr>',
  { desc = 'TmuxNavigateLeft' }
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
  'n', '<a-l>', '<cmd>TmuxNavigateRight<cr>',
  { desc = 'TmuxNavigateRight' }
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
  'i', '<m-;>', '<esc>mt<cmd>normal gcc<cr><cmd>normal `t<cr>a',
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
  'n', '<leader>b', '<cmd>FzfLua buffers<cr>',
  { desc = 'Buffers' }
)

map(
  'n', '<leader>d', 'mtviw"+x`t<cmd>:lua vim.notify("Copy to clipboard", "info", { title = "Clipboard" })<cr>',
  { desc = 'Copy to clipboard' }
)

map(
  'v', '<leader>d', '"+x<cmd>:lua vim.notify("Cut to clipboard", "info", { title = "Clipboard" })<cr>',
  { desc = 'Cut to clipboard' }
)

map(
  'n', '<leader>e', ':lua MiniFiles.open()<cr>',
  { desc = 'Explorer' }
)

map(
  'n', '<leader>f', '<cmd>FzfLua files<cr>',
  { desc = 'Files browser' }
)

map(
  'n', '<leader>E', '<cmd>lua require("oil").toggle_float()<cr>',
  { desc = 'Oil' }
)

map(
  'n', '<leader>g', '<cmd>FzfLua git_files<cr>',
  { desc = 'Git files' }
)

map(
  'n', '<leader>h', '<cmd>FzfLua highlights<cr>',
  { desc = 'Highlights' }
)

map(
  'n', '<leader>H', '<cmd>FzfLua helptags<cr>',
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
  'n', '<leader>j', '<cmd>FzfLua jumps<cr>',
  { desc = 'Jump list' }
)

map(
  'n', '<leader>k', '<cmd>FzfLua keymaps<cr>',
  { desc = 'Keymaps' }
)

map(
  'n', '<leader>l', '<cmd>Lazy<cr>',
  { desc = 'Lazy' }
)

map(
  'n', '<leader>m', '<cmd>FzfLua marks<cr>',
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
  { 'n', 'v' }, '<leader>p', '"+gp<esc><cmd>echo "Paste from clipboard"<cr>',
  { desc = 'Paste from clipboard' }
)

map(
  'n', '<leader>P', '"+gP<esc><cmd>echo "Paste from clipboard"<cr>',
  { desc = 'Paste from clipboard' }
)

map(
  'n', '<leader>q', '<cmd>q<cr>',
  { desc = 'Quit' }
)

map(
  'n', '<leader>Q', '<cmd>!q<cr>',
  { desc = 'Force quit' }
)

map(
  'n', '<leader>r', '<cmd>w<cr><cmd>so<cr>:lua vim.notify("Source " .. vim.fn.bufname("%"), "info", { title = "Clipboard" })<cr>',
  { desc = 'Reload config file' }
)

map(
  'n', '<leader>s', ':%s/\\<C-r><C-w>\\>//g<Left><Left>',
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
  'n', '<leader>up', function() utils.toggle_pairs() end,
  { desc = 'Toggle pairs' }
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
  'n', '<leader>uz', '<cmd>ZenMode<cr>',
  { desc = 'ZenMode' }
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
  'n', '<leader>y', 'mtviw"+y`t<cmd>:lua vim.notify("Copy to clipboard", "info", { title = "Clipboard" })<cr>',
  { desc = 'Copy to clipboard' }
)

map(
  'v', '<leader>y', '"+ygv<esc><cmd>:lua vim.notify("Copy to clipboard", "info", { title = "Clipboard" })<cr>',
  { desc = 'Copy to clipboard' }
)

map(
  'n', '<leader>z', function() utils.toggle_diary(); vim.cmd('ZenMode') end,
  { desc = 'Toggle diary mode' }
)

map(
  'n', '<leader>!', '<cmd>w !chmod +x %<cr>',
  { desc = 'Make file executable' }
)

map(
  'n', '<leader>/', '<cmd>FzfLua live_grep<cr>',
  { desc = 'Fuzzy' }
)

-- Leader leader

map(
  'n', '<leader><leader>p', 'o<esc>"+gp<esc><cmd>:lua vim.notify("Paste from clipboard in new line", "info", { title = "Clipboard" })<cr>',
  { desc = 'Paste from clipboard in new line' }
)

map(
  'n', '<leader><leader>P', 'O<esc>"+gp<esc><cmd>:lua vim.notify("Paste from clipboard in new line", "info", { title = "Clipboard" })<cr>',
  { desc = 'Paste from clipboard in new line' }
)
