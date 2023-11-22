-- Function for mapping
local function map(mode, lhs, rhs, opts)
  local opts = opts or { silent = true }
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Reload file
map('n', '<leader>r', '<cmd>w<cr><cmd>so<cr><cmd>echo "source" bufname("%")<cr>')

-- Scape
map('i', 'kj', '<esc>')

-- Return to normal mode
map('v', 'ç', '<esc>')
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

-- Change line until border
map('n', 'c,', 'ct,')
map('n', 'c.', 'ct.')
map('n', 'c:', 'ct:')
map('n', 'c;', 'ct;')
map('n', 'c)', 'ct)')
map('n', 'c]', 'ct]')
map('n', 'c}', 'ct}')
map('n', 'c>', 'ct>')
map('n', 'c\'', 'ct\'')
map('n', 'c"', 'ct"')

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
map('n', '%', 'G<s-v>gg')

-- Redo
map('n', 'U', '<c-r>')

-- Mark
map('n', 'm', '`')
map('n', 'M', 'm')

-- Register
map('n', "'", '"')
map('v', "'", '"')

-- Yankie to clipboard
map('n', '<leader>y', 'V"+y<esc><cmd>echo "Copy line to clipboard"<cr>')
map('v', '<leader>y', '"+y<cmd>echo "Copy to clipboard"<cr>')

-- Delete to clipboard
map('n', '<leader>d', '^vg_"+x<esc><cmd>echo "Cut line to clipboard"<cr>')
map('v', '<leader>d', '"+x<cmd>echo "Cut to clipboard"<cr>')

-- Paste to clipboard
map('n', '<leader>p', '"+gp<esc><cmd>echo "Paste from clipboard"<cr>')
map('n', '<leader>P', 'o<esc>"+gp<esc><cmd>echo "Paste from clipboard in new line"<cr>')
map('v', '<leader>p', 'c<esc>"+gp<esc><cmd>echo "Paste from clipboard"<cr>')
map('v', '<leader>P', 'D"+gp<esc><cmd>echo "Paste from clipboard"<cr>')

-- Replace select to clipboard :(
-- map('v', 'r', '"0p')

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
map('n', '<leader>ç', '<cmd>noh<cr>')

-- Replace word
map('n', '<leader>s', [[:%s/<c-r><c-w>//g<left><left>]])

-- Keep search results centred
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Split
map('n', 'ss', '<cmd>sp<cr><c-w>k<cmd>bp<cr>')
map('n', 'vv', '<cmd>vsp<cr><c-w>h<cmd>bp<cr>')

-- Stop copy in last char
map('v', 'y', 'ygv<esc>')

-- Indent
map('n', '>', '>>')
map('n', '<', '<<')
map('v', '>', '>gv')
map('v', '<', '<gv')

-- Toggle number
map('n', '<leader>un', '', {
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
map('n', '<leader>uc', '', {
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

-- Navigation panels
map('n', '<c-h>', '<c-w>h')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')

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
map('n', '<leader>bn', '<cmd>ene<cr>')

map('n', '<leader>bd', '<cmd>bd<cr>')
map('n', '<leader>bc', '<cmd>bd<cr>')

map('n', '<a-l>', '<cmd>bn<cr>')
map('n', '<leader>l', '<cmd>bn<cr>')
map('n', '<leader>bl', '<cmd>bn<cr>')
map('n', '<leader>bn', '<cmd>bn<cr>')

map('n', '<a-h>', '<cmd>bp<cr>')
map('n', '<leader>h', '<cmd>bp<cr>')
map('n', '<leader>bh', '<cmd>bp<cr>')
map('n', '<leader>bp', '<cmd>bp<cr>')

-- Next and prev auto-complete
map('n', '<c-k>', '<cmd>cnext<cr>zz')
map('n', '<c-j>', '<cmd>cprev<cr>zz')

-- Menu
map('i', '<c-space>', '<c-n>')
map({'i', 'c'}, '<c-j>', 'pumvisible() ? "\\<c-n>" : "\\<c-j>"', { expr = true })
map({'i', 'c'}, '<c-k>', 'pumvisible() ? "\\<c-p>" : "\\<c-k>"', { expr = true })
map({'i', 'c'}, '<c-c>', 'pumvisible() ? "\\<c-e>" : "\\<c-c>"', { expr = true })

-- Make exec
map('n', '<leader>x', '<cmd>!chmod +x %<cr>')

-- Save
map({'n', 'i', 'v'}, '<c-s>', '<cmd>w!<cr><esc>', { silent = false })

-- Quit and quit all
map('n', '<leader>q', '<cmd>q<cr>')
map('n', '<leader>Q', '<cmd>qa!<cr>')


------------------------------------------------------------
-- Plugins
------------------------------------------------------------

-- hop
map('n', '<leader>fc', '<cmd>HopChar1<cr>')

-- lazy
map('n', '<leader><leader>p', '<cmd>Lazy<cr>')

-- nvim-tree
map('n', '<leader>e', '<cmd>Lex<cr>')
-- if vim.fn.exists(":NvimTreeToggle") ~= 0 then
--   map('n', '<leader>e', '<cmd>Lex<cr>')
--   -- map('n', '<leader>e', '<cmd>!Lex<cr>') Right
-- else
--   map('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')
-- end

-- telescope
map('n', '<c-p>',      '<cmd>Telescope file_browser<cr>')
map('n', '<leader>ff', '<cmd>Telescope file_browser<cr>')
map('n', '<leader>fF', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope git_files<cr>')
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<leader>fl', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fC', '<cmd>Telescope commands<cr>')
map('n', '<leader>fm', '<cmd>Telescope marks<cr>')
map('n', '<leader>ft', '<cmd>Telescope colorscheme<cr>')
map('n', '<leader>fT', '<cmd>Telescope filetypes<cr>')
map('n', '<leader>fh', '<cmd>Telescope highlights<cr>')
map('n', '<leader>fk', '<cmd>Telescope keymaps<cr>')

-- zenmode
map('n', '<leader>z', '<cmd>set wrap<cr> <cmd>set linebreak<cr> <cmd>ZenMode<cr>')

-- tmux
map('n', '<c-h>', '<cmd>lua require("tmux").move_left()<cr>')
map('n', '<c-j>', '<cmd>lua require("tmux").move_down()<cr>')
map('n', '<c-k>', '<cmd>lua require("tmux").move_up()<cr>')
map('n', '<c-l>', '<cmd>lua require("tmux").move_right()<cr>')

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
      map(mode, keymap, cmd, keymap_opts)
    end
  end
end

return M

-- References
-- examples two mode: map({'n', 'x'}, 'cp', '"+y')
-- https://github.com/LunarVim/LunarVim/blob/rolling/lua/lvim/keymappings.lua
-- https://github.com/AstroNvim/AstroNvim/blob/main/lua/core/mappings.lua
-- https://github.com/NvChad/NvChad/blob/main/lua/core/mappings.lua
-- https://github.com/AstroNvim/AstroNvim/blob/53d210d3905f65b9e8f0bdb0c8a307440ebfc3f8/lua/core/utils/init.lua
-- https://stackoverflow.com/questions/18948491/running-python-code-in-vim
-- https://github.com/jdhao/nvim-config/blob/fc144e08957c39954927ae1f48ce70d8b464d258/core/mappings.lua
