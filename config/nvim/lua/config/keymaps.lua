-- Use to local options
local M = {}

-- Function for mapping
function M.map(mode, lhs, rhs, opts)
  local opts = opts or { silent = true }
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Reload file
M.map('n', '<leader>r', '<cmd>w<cr><cmd>so<cr><cmd>echo "source" bufname("%")<cr>')

-- Scape
M.map('i', 'kj', '<esc>')

-- Return to normal mode
M.map('v', 'ç', '<esc>')
M.map('v', '<leader>kj', '<esc>')

-- Navigate in insertmode
M.map('i', '<c-h>', '<left>')
M.map('i', '<c-l>', '<right>')

-- Ignore wordwrap jumpline
M.map('n', 'j', 'gj')
M.map('n', 'k', 'gk')

-- Like C and D
M.map('n', 'Y', 'y$')

-- Begin and end line
M.map({'n', 'v'}, 'L', 'g_')
M.map({'n', 'v'}, 'H', '^')

-- Jump various lines
M.map({'n', 'v'}, 'J', '5j')
M.map({'n', 'v'}, 'K', '5k')

-- Jump half page in the middle
M.map('n', '<c-d>', '<c-d>zz')
M.map('n', '<c-u>', '<c-u>zz')

-- Change text without putting it into the vim register
M.map({'n', 'x'}, 'c', '"_c')
M.map('n', 'C', '"_C')
M.map('n', 'cc', '"_cc')
M.map('n', 'ci,', 'ct,')
M.map('n', 'ci.', 'ct.')
M.map('n', 'ci:', 'ct:')
M.map('n', 'ci;', 'ct;')

-- Add new line in normal mode
M.map('n', '<leader>o', 'm`o<esc>``')
M.map('n', '<leader>O', 'm`O<esc>``')
M.map('n', '<a-o>', 'm`o<esc>``')
M.map('n', '<a-O>', 'm`O<esc>``')

-- Plus number
M.map('n', '=', '<c-a>')
M.map('n', '-', '<c-x>')

-- Select all
M.map('n', '<leader>a', 'G<s-v>gg')
M.map('n', '%', 'G<s-v>gg')

-- Redo
M.map('n', 'U', '<c-r>')

-- Copy to clipboard
M.map('n', '<leader>y', 'V"+y')
M.map('v', '<leader>y', '"+y')
M.map('n', '<a-y>', 'V"+y')
M.map('v', '<a-y>', '"+y')

-- Cut to clipboard
M.map('n', '<leader>d', '^vg_"+x')
M.map('v', '<leader>d', '"+x')

-- Paste to clipboard
M.map('n', '<leader>p', '"+gp<esc><cmd>echo "Paste of clipboard"<cr>')
M.map('n', '<leader>P', 'o<esc>"+gp<esc><cmd>echo "Paste of clipboard in new line"<cr>')
M.map('n', '<a-p>', '"+gp<esc><cmd>echo "Paste of clipboard"<cr>')
M.map('n', '<a-P>', 'o<esc>"+gp<esc><cmd>echo "Paste of clipboard in new line"<cr>')

-- Replace yank
M.map('n', 'R', '"0p')

-- Paste with no resgister
M.map('x', '<leader>p', '"_dP')

-- Join lines
M.map('n', '<leader>j', 'J')

-- Delete not copy
M.map('n', 'x', '"_x')
M.map('n', '<del>', '"_x')

-- Move lines
M.map('n', '<a-j>', '<cmd>m .+1<cr>')
M.map('n', '<a-k>', '<cmd>m .-2<cr>')
M.map('i', '<a-j>', '<esc><cmd>m .+1<cr>==gi')
M.map('i', '<a-k>', '<esc><cmd>m .-2<cr>==gi')
M.map('v', '<a-j>', ":m '>+1<cr>gv=gv")
M.map('v', '<a-k>', ":m '<-2<cr>gv=gv")

-- Clone lines
M.map('n', '<s-a-j>', 'yyp')
M.map('n', '<s-a-k>', 'yyP')
M.map('i', '<s-a-j>', '<esc>yypi')
M.map('i', '<s-a-k>', '<esc>yyPi')
M.map('v', '<s-a-j>', ":'<,'>copy '><cr>")
M.map('v', '<s-a-k>', 'ygvO<esc>P')

-- Keep cursor end select when visual copy
M.map('v', 'y', 'ygv<esc>')

-- Remove highlight
M.map({'n', 'i'}, '<esc>', '<cmd>noh<cr><esc>')
M.map('n', '<leader>ç', '<cmd>noh<cr>')

-- Replace word
M.map('n', '<leader>s', [[:%s/<c-r><c-w>//g<left><left>]])

-- Keep search results centred
M.map('n', 'n', 'nzzzv')
M.map('n', 'N', 'Nzzzv')

-- M to mark m to jump
M.map('n', 'm', '`')
M.map('n', 'M', 'm')

-- Split
M.map('n', 'ss', '<cmd>sp<cr><c-w>k<cmd>bp<cr>')
M.map('n', 'vv', '<cmd>vsp<cr><c-w>h<cmd>bp<cr>')

-- Stop copy in last char
M.map('v', 'y', 'ygv<esc>')

-- Indent
M.map('n', '>', '>>')
M.map('n', '<', '<<')
M.map('v', '>', '>gv')
M.map('v', '<', '<gv')

-- Toggle number
M.map('n', '<leader>un', '', {
  noremap = true,
  callback = function()
    if vim.o.number then
      vim.opt.number = false
      vim.opt.relativenumber = false
    else
      vim.opt.number = true
      vim.opt.relativenumber = true
    end

    vim.cmd 'redraw'
    print('Toggle number')
  end
})

-- Toggle cmd height
M.map('n', '<leader>uc', '', {
  noremap = true,
  callback = function()
    if vim.o.cmdheight == 1 then
      vim.opt.cmdheight = 0
    else
      vim.opt.cmdheight = 1
    end

    vim.cmd 'redraw'
    print('Toggle cmdheight')
  end
})

-- Next and prev auto-complete
M.map('n', '<c-k>', '<cmd>cnext<cr>zz')
M.map('n', '<c-j>', '<cmd>cprev<cr>zz')

-- Navigation panels
M.map('n', '<c-h>', '<c-w>h')
M.map('n', '<c-j>', '<c-w>j')
M.map('n', '<c-k>', '<c-w>k')
M.map('n', '<c-l>', '<c-w>l')

-- Move panels
M.map('n', '<c-w>h', '<c-w>H')
M.map('n', '<c-w>j', '<c-w>J')
M.map('n', '<c-w>k', '<c-w>K')
M.map('n', '<c-w>l', '<c-w>L')

-- Resize
M.map('n', '<up>', '<cmd>resize +2<cr>')
M.map('n', '<down>', '<cmd>resize -2<cr>')
M.map('n', '<left>', '<cmd>vertical resize +2<cr>')
M.map('n', '<right>', '<cmd>vertical resize -2<cr>')

-- Buffer
M.map('n', '<leader>c', '<cmd>bd<cr>')
M.map('n', '<leader>n', '<cmd>ene<cr>')
M.map('n', '<leader>w', '<cmd>bd<cr>')
M.map('n', '<a-n>', '<cmd>ene<cr>')
M.map('n', '<a-l>', '<cmd>bn<cr>')
M.map('n', '<a-h>', '<cmd>bp<cr>')
M.map('n', '<a-w>', '<cmd>bd<cr>')

-- Menu
M.map('i', '<c-space>', '<c-n>')
M.map({'i', 'c'}, '<c-j>', 'pumvisible() ? "\\<c-n>" : "\\<c-j>"', { expr = true })
M.map({'i', 'c'}, '<c-k>', 'pumvisible() ? "\\<c-p>" : "\\<c-k>"', { expr = true })
M.map({'i', 'c'}, '<c-c>', 'pumvisible() ? "\\<c-e>" : "\\<c-c>"', { expr = true })

-- Make exec
M.map('n', '<leader>x', '<cmd>!chmod +x %<cr>')

-- Save
M.map({'n', 'i', 'v'}, '<c-s>', '<cmd>w!<cr><esc>', { silent = false })

-- Quit
M.map('n', '<leader>q', '<cmd>q<cr>')

-- Quit all
M.map('n', '<leader>Q', '<cmd>qa!<cr>')


------------------------------------------------------------
-- Plugins
------------------------------------------------------------

-- hop
M.map('n', '<leader><leader>f', '<cmd>HopChar1<cr>')

-- nvim-tree
if vim.fn.exists(":NvimTreeToggle") ~= 0 then
  M.map('n', '<leader>e', '<cmd>Lex<cr>')
else
  M.map('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')
end

-- telescope
M.map('n', '<c-p>', '<cmd>Telescope git_files<cr>')
-- M.map('n', '<c-p>', '<cmd>Telescope file_browser<cr>')
M.map('n', '<leader>F', '<cmd>Telescope file_files<cr>')
M.map('n', '<leader>b', '<cmd>Telescope buffers<cr>')
M.map('n', '<leader>tc', '<cmd>Telescope commands<cr>')
M.map('n', '<leader>tg', '<cmd>Telescope git_files<cr>')
M.map('n', '<leader>m',  '<cmd>Telescope marks<cr>')
M.map('n', '<leader>tc', '<cmd>Telescope colorscheme<cr>')
M.map('n', '<leader>tt', '<cmd>Telescope filetypes<cr>')
M.map('n', '<leader>th', '<cmd>Telescope highlights<cr>')
M.map('n', '<leader>tk', '<cmd>Telescope keymaps<cr>')

-- zenmode
M.map('n', '<leader>z', '<cmd>ZenMode<cr> <cmd>set wrap<cr> <cmd>set linebreak<cr>')

-- tmux
M.map('n', '<c-h>', '<cmd>lua require("tmux").move_left()<cr>')
M.map('n', '<c-j>', '<cmd>lua require("tmux").move_down()<cr>')
M.map('n', '<c-k>', '<cmd>lua require("tmux").move_up()<cr>')
M.map('n', '<c-l>', '<cmd>lua require("tmux").move_right()<cr>')

-- Future mappings
local map_table = {
  n = {
    ['<leader>9'] = { '<cmd>enew<cr>' }
  }
}

-- Iterate over the first keys for each mode
for mode, maps in pairs(map_table) do
  -- iterate over each keybinding set in the current mode
  for keymap, options in pairs(maps) do
    -- build the options for the command accordingly
    if options then
      local cmd = options
      local keymap_opts = keymap_opts or {}
      if type(options) == 'table' then
        cmd = options[1]
        keymap_opts = vim.tbl_deep_extend('force', options, keymap_opts)
        keymap_opts[1] = nil
      end
      -- extend the keybinding options with the base provided and set the mapping
      M.map(mode, keymap, cmd, keymap_opts)
    end
  end
end

return M

-- References
-- examples two mode: M.map({'n', 'x'}, 'cp', '"+y')
-- https://github.com/LunarVim/LunarVim/blob/rolling/lua/lvim/keymappings.lua
-- https://github.com/AstroNvim/AstroNvim/blob/main/lua/core/mappings.lua
-- https://github.com/NvChad/NvChad/blob/main/lua/core/mappings.lua
-- https://github.com/AstroNvim/AstroNvim/blob/53d210d3905f65b9e8f0bdb0c8a307440ebfc3f8/lua/core/utils/init.lua
-- https://stackoverflow.com/questions/18948491/running-python-code-in-vim
-- https://github.com/jdhao/nvim-config/blob/fc144e08957c39954927ae1f48ce70d8b464d258/core/mappings.lua
