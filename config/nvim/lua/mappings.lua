------------------------------------------------------------
-- Mappings
------------------------------------------------------------

-- Vars
local cmd = vim.cmd

-- Function for mapping
function map(mode, lhs, rhs, opts)
  local opts = opts or { silent = true }
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Source file
map('n', '<leader>r', '<cmd>w<cr><cmd>so<cr><cmd>echo "source" bufname("%")<cr>')

-- Scape
map('i', 'kj', '<esc>')
map('v', '<leader>kj', '<esc>')

-- Navigate in insertmode
map('i', '<c-h>', '<left>')
map('i', '<c-l>', '<right>')

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
map('n', '<a-o>', 'm`o<esc>``')
map('n', '<a-O>', 'm`O<esc>``')

-- Plus number
map('n', '=', '<c-a>')
map('n', '-', '<c-x>')

-- Select all
map('n', '<leader>a', 'G<s-v>gg')

-- Copy to clipboard
map('n', '<leader>y', 'V"+y')
map('v', '<leader>y', '"+y')
map('n', '<a-y>', 'V"+y')
map('v', '<a-y>', '"+y')

-- Cut to clipboard
map('n', '<leader>d', '^vg_"+x')
map('v', '<leader>d', '"+x')

-- Paste to clipboard
map('n', '<leader>p', '"+gp<esc><cmd>echo "Paste of clipboard"<cr>')
map('n', '<leader>P', 'o<esc>"+gp<esc><cmd>echo "Paste of clipboard in new line"<cr>')
map('n', '<a-p>', '"+gp<esc><cmd>echo "Paste of clipboard"<cr>')
map('n', '<a-P>', 'o<esc>"+gp<esc><cmd>echo "Paste of clipboard in new line"<cr>')

-- Paste with no resgister
map('x', '<leader>p', '"_dP')

-- Join lines
map('n', '<leader>j', 'J')

-- Delete not copy
map('n', 'x', '"_x')
map('n', '<del>', '"_x')

-- Move lines
map('n', '<a-j>', '<cmd>m .+1<cr>')
map('n', '<a-k>', '<cmd>m .-2<cr>')
map('i', '<a-j>', '<esc><cmd>m .+1<cr>==gi')
map('i', '<a-k>', '<esc><cmd>m .-2<cr>==gi')
map('v', '<a-j>', ":m '>+1<cr>gv=gv")
map('v', '<a-k>', ":m '<-2<cr>gv=gv")

-- Clone lines
map('n', '<s-a-j>', 'yyp')
map('n', '<s-a-k>', 'yyP')
map('i', '<s-a-j>', '<esc>yypi')
map('i', '<s-a-k>', '<esc>yyPi')
map('v', '<s-a-j>', ":'<,'>copy '><cr>")
map('v', '<s-a-k>', 'ygvO<esc>P')

-- Keep cursor end select when visual copy
map('v', 'y', 'ygv<esc>')

-- Remove highlight
map({'n', 'i'}, '<esc>', '<cmd>noh<cr><esc>')
map('n', '<leader>h', '<cmd>noh<cr>')

-- Substitute word
map('n', '<leader>s', [[:%s/<c-r><c-w>//g<left><left>]])

-- Keep search results centred
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Format
-- map('n', '<leader>f', '<cmd>retab<cr>')

-- Q to recorder q to play
map('n', 'q', 'Q')
map('n', 'Q', 'q')

-- M to mark m to jump
map('n', 'm', '`')
map('n', 'M', 'm')

-- Split
map('n', 'ss', '<cmd>sp<cr><c-w>k<cmd>bp<cr>')
map('n', 'vv', '<cmd>vsp<cr><c-w>h<cmd>bp<cr>')

-- Stop copy in last char
map('v', 'y', 'ygv<esc>')

-- indent
map('n', '>', '>>')
map('n', '<', '<<')
map('v', '>', '>gv')
map('v', '<', '<gv')

-- Next and prev auto-complete
map('n', '<c-k>', '<cmd>cnext<cr>zz')
map('n', '<c-j>', '<cmd>cprev<cr>zz')

-- Navigation panels
map('n', '<c-h>', '<c-w>h')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')

-- tmux
-- map('n', '<c-h>', '<cmd>lua require("tmux").move_left()<cr>')
-- map('n', '<c-j>', '<cmd>lua require("tmux").move_down()<cr>')
-- map('n', '<c-k>', '<cmd>lua require("tmux").move_up()<cr>')
-- map('n', '<c-l>', '<cmd>lua require("tmux").move_right()<cr>')

-- Move panels
map('n', '<c-w>h', '<c-w>H')
map('n', '<c-w>j', '<c-w>J')
map('n', '<c-w>k', '<c-w>K')
map('n', '<c-w>l', '<c-w>L')

-- Resize
map('n', '<up>', '<cmd>resize +2<cr>')
map('n', '<down>', '<cmd>resize -2<cr>')
map('n', '<left>', '<cmd>vertical resize +2<cr>')
map('n', '<right>', '<cmd>vertical resize -2<cr>')

-- Buffer
map('n', '<leader>n', '<cmd>ene<cr>')
map('n', '<leader>w', '<cmd>bd<cr>')
map('n', '<a-n>', '<cmd>ene<cr>')
map('n', '<a-l>', '<cmd>bn<cr>')
map('n', '<a-h>', '<cmd>bp<cr>')
map('n', '<a-w>', '<cmd>bd<cr>')

-- Menu
map('i', '<c-space>', '<c-n>')
map({'i', 'c'}, '<c-j>', 'pumvisible() ? "\\<c-n>" : "\\<c-j>"', { expr = true })
map({'i', 'c'}, '<c-k>', 'pumvisible() ? "\\<c-p>" : "\\<c-k>"', { expr = true })
map({'i', 'c'}, '<c-c>', 'pumvisible() ? "\\<c-e>" : "\\<c-c>"', { expr = true })

-- Make exec
map('n', '<leader>x', '<cmd>!chmod +x %<cr>')

-- Save
map({'n', 'i', 'v'}, '<c-s>', '<cmd>w!<cr><esc>', { silent = false })

-- Quit
map('n', '<leader>q', '<cmd>q!<cr>')

------------------------------------------------------------
-- Plugins
------------------------------------------------------------

-- map('n', '<leader>e', '<cmd>Lex<cr>')

-- toggleterm
-- map('n', '<a-h>', '<cmd>ToggleTerm size=10<cr>')
-- map('n', '<a-v>', '<cmd>ToggleTerm size=80 direction=vertical<cr>')

-- autocmd
vim.api.nvim_exec([[
  autocmd BufRead,BufNewFile *.sh nnoremap <c-cr> <cmd>w!<cr> <cmd>exec '!bash' shellescape(@%, 1)<cr>
  autocmd BufRead,BufNewFile *.py nnoremap <c-cr> <cmd>w!<cr> <cmd>exec '!python' shellescape(@%, 1)<cr>
]], false)

-- future mappings
local map_table = {
  n = {
    ['<leader>ç'] = { '<cmd>enew<cr>' }
  }
}

-- iterate over the first keys for each mode
for mode, maps in pairs(map_table) do
  -- iterate over each keybinding set in the current mode
  for keymap, options in pairs(maps) do
    -- build the options for the command accordingly
    if options then
      local cmd = options
      local keymap_opts = keymap_opts or {}
      if type(options) == "table" then
        cmd = options[1]
        keymap_opts = vim.tbl_deep_extend("force", options, keymap_opts)
        keymap_opts[1] = nil
      end
      -- extend the keybinding options with the base provided and set the mapping
      map(mode, keymap, cmd, keymap_opts)
    end
  end
end

-- References
-- examples two mode: map({'n', 'x'}, 'cp', '"+y')
-- https://github.com/LunarVim/LunarVim/blob/rolling/lua/lvim/keymappings.lua
-- https://github.com/AstroNvim/AstroNvim/blob/main/lua/core/mappings.lua
-- https://github.com/NvChad/NvChad/blob/main/lua/core/mappings.lua
-- https://github.com/AstroNvim/AstroNvim/blob/53d210d3905f65b9e8f0bdb0c8a307440ebfc3f8/lua/core/utils/init.lua
-- https://stackoverflow.com/questions/18948491/running-python-code-in-vim
-- https://github.com/jdhao/nvim-config/blob/fc144e08957c39954927ae1f48ce70d8b464d258/core/mappings.lua
