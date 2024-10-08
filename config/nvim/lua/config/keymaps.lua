local utils = require('config.utils')
local map = vim.keymap.set
vim.g.mapleader = ' '

-- Normal

map(
  'x', 'c', '"_c',
  { desc = 'Change text without putting it into register' }
)

map(
  'n', 'gd', function() vim.lsp.buf.declaration() end,
  { desc = 'Go definition' }
)

map(
  'n', 'gD', function() vim.lsp.buf.definition() end,
  { desc = 'Go declaration' }
)

map(
  'n', 'gi', function() vim.lsp.buf.implementation() end,
  { desc = 'Go declaration' }
)

map(
  'n', 'gK', function() vim.lsp.buf.hover() end,
  { desc = 'Hover definition' }
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
  'n', 'Q', 'Q',
  { desc = 'Play macro' }
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
  'n', 'Y', 'y$',
  { desc = 'Like C and D' }
)

map(
  'n', 'ç', '<cmd>noh<cr>',
  { desc = 'Remove highlight' }
)

map(
  'n', ']d', function() vim.diagnostic.goto_next() end,
  { desc = 'Next diagnostic' }
)

map(
  'n', '[d', function() vim.diagnostic.goto_prev() end,
  { desc = 'Prev diagnostic' }
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
  'n', '<up>', '<cmd>resize +2<cr>',
  { desc = 'Resize height taller' }
)

map(
  'n', '<down>', '<cmd>resize -2<cr>',
  { desc = 'Resize height shorter' }
)

map(
  'n', '<left>', '<cmd>vertical resize +2<cr>',
  { desc = 'Resize height left' }
)

map(
  'n', '<right>', '<cmd>vertical resize -2<cr>',
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
  'n', '<c-s-a-j>', 'yyp',
  { desc = 'Clone line to down' }
)

map(
  'n', '<c-s-a-k>', 'yyP',
  { desc = 'Clone line to up' }
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
  'i', '<c-backspace>', '<c-w>',
  { desc = 'Delete word back' }
)

map(
  'i', '<c-;>', '<esc>:normal gcc<cr>i',
  { desc = 'Comment line' }
)

map(
  'i', '<c-a-j>', '<esc><cmd>m .+1<cr>==gi',
  { desc = 'Move line to down' }
)

map(
  'i', '<c-a-k>', '<esc><cmd>m .-2<cr>==gi',
  { desc = 'Move line to up' }
)

map(
  'i', '<c-s-a-j>', '<esc>yypi',
  { desc = 'Clone line down' }
)

map(
  'i', '<c-s-a-k>', '<esc>yyPi',
  { desc = 'Clone line up' }
)

-- Visual

map(
  'v', 'y', 'ygv<esc>',
  { desc = 'Keep cursor end select when visual copy' }
)

map(
  'v', 'ç', '<esc>',
  { desc = 'Return to normal mode' }
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

map(
  'v', '<c-s-a-j>', ":'<,'>copy '><cr>",
  { desc = 'Clone select line(s) down' }
)

map(
  'v', '<c-s-a-k>', 'ygvO<esc>P',
  { desc = 'Clone select line(s) up' }
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
  { desc = 'Delete to clipboard' }
)

map(
  'v', '<leader>d', '"+x<cmd>echo "Cut to clipboard"<cr>',
  { desc = 'Cut to clipboard' }
)

map(
  'n', '<leader>e', '<cmd>lua require("oil").toggle_float()<cr>',
  { desc = 'Oil' }
)

map(
  'n', '<leader>E', '<cmd>lua require("mini.files").open()<cr>',
  { desc = 'MiniFiles' }
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
  { desc = '' }
)

map(
  'n', '<leader>fgc', '<cmd>Telescope git_commits<cr>',
  { desc = '' }
)

map(
  'n', '<leader>fgs', '<cmd>Telescope git_status<cr>',
  { desc = '' }
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
  { desc = 'Add new line in normal mode' }
)

map(
  'n', '<leader>O', 'm`O<esc>``',
  { desc = 'Add new line in normal mode' }
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
  'v', '<leader>r', '"hy:%s/<c-r>h//g<left><left>',
  { desc = 'Replace selected' }
)

map(
  'n', '<leader>R', ':%s/<c-r><c-w>//g<left><left>',
  { desc = 'Replace word in cursor' }
)

map(
  'v', '<leader>R', ':s/<c-r><c-w>/<c-r>+/<cr>e',
  { desc = 'Replace select to clipboard and keep cursor' }
)

map(
  'n', '<leader>s',
  function()
    local cmd = ':%s/<C-r><C-w>//g<Left><Left>'
    local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
    vim.api.nvim_feedkeys(keys, 'n', false)
  end,
  { desc = 'Substitute current word' }
)

map(
  'n', '<leader>S', '<cmd>w !sudo tee %<cr>',
  { desc = 'Save file with sudo', silent = false }
)

map(
  'n', '<leader>uc', function() utils.toggle_cmdheight() end,
  { desc = 'Toggle cmd height' }
)

map(
  'n', '<leader>ui', function() utils.toggle_ia() end,
  { desc = 'Toggle ia' }
)

map(
  'n', '<leader>ul', function() utils.toggle_listchars() end,
  { desc = 'Toggle list chars' }
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
  { desc = 'Toggle relative number', }
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
  'n', '<leader>uz', '<cmd>set wrap<cr> <cmd>set linebreak<cr> <cmd>ZenMode<cr>',
  { desc = 'Toggle zenMode' }
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
  { desc = 'Yank current line to clipboard' }
)

map(
  'v', '<leader>y', '"+ygv<esc><cmd>echo "Copy to clipboard"<cr>',
  { desc = 'Yanki selectted line to clipboard' }
)

map(
  'n', '<leader>z', '<cmd>set wrap<cr> <cmd>set linebreak<cr> <cmd>ZenMode<cr>',
  { desc = 'ZenMode' }
)

map(
  'n', '<leader><leader>e', '<cmd>NvimTreeToggle<cr>',
  { desc = 'NvimTree' }
)

map(
  'n', '<leader><leader>E', '<cmd>15Lex<cr>',
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
