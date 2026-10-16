local utils = require('config.utils')
local map = vim.keymap.set

-- news in 0.13
-- val - motion all
-- vil - motion line
-- q   - multi cursor
-- ZR  - reload conf
-- {[,]}<space>

-- Normal

map(
  { 'n', 'x' }, 'ç', ':',
  { desc = 'Enter in command mode' }
)


map(
  'n', 'j', 'v:count == 0 ? "gj" : "j"',
  { expr = true, desc = 'Ignore wordwrap jumpline' }
)

map(
  'n', 'k', 'v:count == 0 ? "gk" : "k"',
  { expr = true, desc = 'Ignore wordwrap jumpline' }
)

map(
  { 'n', 'v' }, 'H', '^',
  { desc = 'Go to begin line' }
)

map(
  { 'n', 'v' }, 'L', 'g_',
  { desc = 'Go to end line' }
)

map(
  'n', 'J', 'mzJ`z==',
  { desc = 'Join lines' }
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
  'n', 'n', 'nzz',
  { desc = 'Next search and center' }
)

map(
  'n', 'N', 'Nzz',
  { desc = 'Prev search and center' }
)

map(
  'n', 's', function()
    require('mini.jump2d').start(require('mini.jump2d').builtin_opts.single_character)
  end,
  { desc = 'Char' }
)

map(
  'n', 'S', function() require('mini.jump2d').start() end,
  { desc = 'Char anywhere' }
)

map(
  'n', 'U', '<c-r>',
  { desc = 'Redo' }
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

map(
  'n', '<c-d>', '<c-d>zz',
  { desc = 'Page down' }
)

map(
  'n', '<c-u>', '<c-u>zz',
  { desc = 'Page up' }
)

map(
  'n', '<c-i>', '<c-i>zz',
  { desc = 'Jump forwards' }
)

map(
  'n', '<c-o>', '<c-o>zz',
  { desc = 'Jump backwards' }
)

map(
  { 'n', 'i', 's', 'x' }, '<c-s>', '<cmd>w<cr><esc>',
  { desc = 'Save file' }
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
  'n', '<tab>', '<cmd>bn<cr>',
  { desc = 'Buffer next' }
)

map(
  'n', '<s-tab>', '<cmd>bp<cr>',
  { desc = 'Buffer prev' }
)

-- Insert

map(
  'i', 'kj', '<esc>',
  { desc = 'Return to normal mode' }
)

-- Força a seleção do primeiro item e confirma
map('i', '<c-y>', function()
    local info = vim.fn.complete_info({'selected'})
    if info.selected == -1 then
      return '<c-n><c-y>'
    end
    return '<c-y>'
  end,
  { expr = true, replace_keycodes = true }
)

-- Visual

map(
  'x', 'y', 'ygv<esc>',
  { desc = 'Keep cursor when visual copy' }
)

map(
  'x', 'Y', '"+ygv<esc><cmd>echo "copy to clipboard"<cr>',
  { desc = 'Copy to clipboard' }
)

map(
  'x', '>', '>gv',
  { desc = 'Add indent' }
)

map(
  'x', '<', '<gv',
  { desc = 'Remove indent' }
)

map(
  'x', '<c-a-j>', ":m '>+1<cr>gv=gv",
  { desc = 'Move select line(s) to down' }
)

map(
  'x', '<c-a-k>', ":m '<-2<cr>gv=gv",
  { desc = 'Move select line(s) to up' }
)

-- Command

map(
  'c', '<c-a>', '<home>',
  { desc = 'Beginner of line' }
)

-- Terminal

map(
  't', '<c-w>N', '<c-\\><c-n>',
  { desc = 'Return normal mode in terminal' }
)

-- Leader

map(
  'n', '<leader>b', function() require('snacks').picker.buffers() end,
  { desc = 'Buffers' }
)

map(
  'n', '<leader>e', function() -- Close if open a file
    if require('mini.files').open() then
      require('mini.files').close()
    end
  end,
  { desc = 'Explorer' }
)

map(
  'n', '<leader>E', '<cmd>lua require("oil").toggle_float()<cr>',
  { desc = 'Oil' }
)

map(
  'n', '<leader>f', function()
      require('snacks').picker.files({
        cwd = vim.fs.root(0, { '.git', 'package.json' }) or vim.uv.cwd()
      })
    end,
  { desc = 'Files' }
)

map(
  'n', '<leader>F', function() require('snacks').picker.files({ cwd = vim.fn.expand('%:p:h') }) end,
  { desc = 'Files in current dir' }
)

map(
  'n', '<leader>gb', function() require('snacks').picker.git_branches() end,
  { desc = 'Git branches' }
)

map(
  'n', '<leader>gf', function() require('snacks').picker.git_files() end,
  { desc = 'Git files' }
)

map(
  'n', '<leader>gl', function() require('snacks').picker.git_log() end,
  { desc = 'Git log' }
)

map(
  'x', '<leader>gs', ":sort<cr><cmd>lua vim.notify('Sorted selection')<cr>",
  { desc = 'Sort selection' }
)

map(
  'n', '<leader>gS', function() require('snacks').picker.git_status() end,
  { desc = 'Git status' }
)

map(
  'n', '<leader>gd', function() require('snacks').picker.lsp_definitions() end,
  { desc = 'Definitions' }
)

map(
  'n', '<leader>gD', function() require('snacks').picker.lsp_declarations() end,
  { desc = 'Declarations' }
)

map(
  'n', '<leader>gI', function() require('snacks').picker.lsp_implementations() end,
  { desc = 'Implementations' }
)

map(
  'n', '<leader>gr', function() require('snacks').picker.lsp_references() end,
  { desc = 'References' }
)

map(
  'n', '<leader>gy', function() require('snacks').picker.lsp_type_definitions() end,
  { desc = 'Type definitions' }
)

map(
  'n', '<leader>h', function() require('snacks').picker.highlights() end,
  { desc = 'Highlights' }
)

map(
  'n', '<leader>H', function() require('snacks').picker.help() end,
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
  'n', '<leader>j', function() require('snacks').picker.jumps() end,
  { desc = 'Jump list' }
)

map(
  'n', '<leader>k', function() require('snacks').picker.keymaps() end,
  { desc = 'Keymaps' }
)

map(
  'n', '<leader>K', function() local word = vim.fn.expand('<cword>') vim.cmd('help ' .. word) end,
  { desc = 'Help for current word' }
)

map(
  'n', '<leader>lf',function() require('conform').format() end,
  { desc = 'Format' }
)

map(
  'n', '<leader>m', function() require('snacks').picker.marks() end,
  { desc = 'Marks' }
)

map(
  'n', '<leader>n', '<cmd>ene<cr>',
  { desc = 'Buffer new' }
)

map(
  'n', '<leader>p', 'm`o<Esc>"+p==``<cmd>:lua vim.notify("Paste from clipboard in next line", "info", { title = "Clipboard" })<cr>',
  { desc = 'Paste from clipboard in next line' }
)

map(
  'n', '<leader>P', 'm`O<Esc>"+p==``<cmd>:lua vim.notify("Paste from clipboard in previous line", "info", { title = "Clipboard" })<cr>',
  { desc = 'Paste from clipboard in previous line' }
)

map(
  'n', '<leader>r', '<cmd>restart<cr>',
  { desc = 'Restart' }
)

map(
  'n', '<leader>R', function() require('snacks').picker.registers() end,
  { desc = 'Registers' }
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
  'x', '<leader>s', '"hy:%s/<c-r>h//g<left><left>',
  { desc = 'Substitute selected word' }
)

map(
  'x', '<leader>S', '"hy:%s/<c-r><c-w>/<c-r>+/g<left><left>',
  { desc = 'Substitute selected word to clipboard' }
)

map(
  'n', '<leader>t', '<cmd>below term<cr>i',
  { desc = 'Open terminal' }
)

map(
  'n', '<leader>T', '<cmd>vert term<cr>i',
  { desc = 'Open vertical terminal' }
)

map(
  'n', '<leader>uac', function() utils.toggle_autocomplete() end,
  { desc = 'Toggle autocomplete' }
)

map(
  'n', '<leader>ucw', '<cmd>ToggleCursorWord<cr>',
  { desc = 'Toggle cursorword' }
)

map(
  'n', '<leader>ucc', function() utils.toggle_colorcolumn() end,
  { desc = 'Toggle colorcolumn' }
)

map(
  'n', '<leader>udc', function() utils.toggle_document_color() end,
  { desc = 'Toggle document color' }
)

map(
  'n', '<leader>udg', function() utils.toggle_diagnostic() end,
  { desc = 'Toggle diagnostic' }
)

map(
  'n', '<leader>udv', function() utils.toggle_diagnostic_virtual_text() end,
  { desc = 'Toggle diagnostic virtual text' }
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
  'n', '<leader>un', function() utils.toggle_number() end,
  { desc = 'Toggle line number' }
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
  'n', '<leader>ut', function() utils.toggle_treesitter() end,
  { desc = 'Toggle treesitter' }
)

map(
  'n', '<f9>', function() utils.toggle_treesitter() end,
  { desc = 'Toggle treesitter' }
)

map(
  'n', '<leader>uw', function() utils.toggle_wrap() end,
  { desc = 'Toggle wrap' }
)

map(
  'n', '<leader>uz', function() require('snacks').zen() end,
  { desc = 'ZenMode' }
)

map(
  'n', '<leader>W', '<cmd>w !sudo -S tee %<cr>',
  { desc = 'Save file with sudo', silent = false }
)

map(
  'x', '<leader>x', ":'<,'>w !bash<cr>",
  { desc = 'Execute selected line(s)' }
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
  'n', '<leader>y', 'mtviw"+y`t<cmd>:lua vim.notify("copy to clipboard", "info", { title = "Clipboard" })<cr>',
  { desc = 'Copy to clipboard' }
)

map(
  'x', '<leader>y', '"+ygv<esc><cmd>:lua vim.notify("copy to clipboard", "info", { title = "Clipboard" })<cr>',
  { desc = 'Copy to clipboard' }
)

map(
  'n', '<leader>z', function() utils.toggle_diary(); require('snacks').zen() end,
  { desc = 'Toggle diary mode' }
)

map(
  'n', '<leader>!', '<cmd>w !chmod +x %<cr>',
  { desc = 'Make file executable' }
)

map(
  'n', '<leader>.', '<cmd>rightbelow vsplit term://bash % | startinsert<cr>',
  { desc = 'Execute bash to current file in vertical' }
)

map(
  'n', '<leader>/', function() require('snacks').picker.grep() end,
  { desc = 'Fuzzy grep' }
)

map(
  'n', '<leader>:', function() require('snacks').picker.command_history() end,
  { desc = 'Command history' }
)

map(
  'n', '<leader>?', function() require('snacks').picker.grep_buffers() end,
  { desc = 'Fuzzy live_grep' }
)

-- Leader leader

map(
  'n', '<leader><leader>m', '<cmd>Mason<cr>',
  { desc = 'Mason' }
)

map(
  'n', '<leader><leader>s', function() require('snacks').picker.lsp_symbols() end,
  { desc = 'Symbols' }
)

map(
  'n', '<leader><leader>u', '<cmd>:lua vim.pack.update()<cr>',
  { desc = 'Update plugins' }
)
