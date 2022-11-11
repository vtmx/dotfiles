------------------------------------------------------------
-- Mappings
------------------------------------------------------------

-- vars
local cmd = vim.cmd

-- function
function map(mode, lhs, rhs, opts)
  local opts = opts or { silent = true }
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- leader
vim.g.mapleader = ' '

-- scape
map('i', 'kj', '<esc>')
map('v', '<leader>kj', '<esc>')

-- navigate in insertmode
map('i', '<c-h>', '<left>')
map('i', '<c-l>', '<right>')

-- ignore wordwrap jumpline
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- like C and D
map('n', 'Y', 'y$')

-- begin and end line
map('n', 'L', 'g_')
map('n', 'H', '^')
map('v', 'L', 'g_')
map('v', 'H', '^')

-- jump varius lines
map('n', 'J', '5j')
map('n', 'K', '5k')
map('v', 'J', '5j')
map('v', 'K', '5k')

-- new line in normal mode
map('n', '<leader>o', 'm`o<esc>``')
map('n', '<leader>O', 'm`O<esc>``')

-- select all
map('n', '<leader>a', 'G<s-v>gg')

-- copy to clipboard
map('n', '<leader>y', 'V"+y')
map('v', '<leader>y', '"+y')

-- cut to clipboard
map('n', '<leader>d', '^vg_"+x')
map('v', '<leader>d', '"+x')

-- paste to clipboard
map('n', '<leader>p', '"+gp<esc>')
map('n', '<leader>P', 'o<esc>"+gp<esc>')

-- paste with no resgister
map('x', '<leader>p', '"_dP')

-- join lines
map('n', '<leader>j', 'J')

-- delete not copy
map('n', 'x', '"_x')
map('n', '<del>', '"_x')

-- move line like vscode
map('i', '<a-j>', '<esc><cmd>m .+1<cr>==gi')
map('i', '<a-k>', '<esc><cmd>m .-2<cr>==gi')
map('n', '<a-j>', '<cmd>m+<cr>')
map('n', '<a-k>', '<cmd>m-2<cr>')
map('v', '<a-j>', "<cmd>m '>+1<cr>gv-gv")
map('v', '<a-k>', "<cmd>m '<-2<cr>gv-gv")

-- clone line
map('n', '<c-a-j>', 'yyp')
map('n', '<c-a-k>', 'yyP')
map('v', '<c-a-j>', ":'<,'>copy '><cr>")
map('v', '<c-a-k>', 'ygvO<esc>P')

-- keep cursor end select when visual copy
map('v', 'y', 'ygv<esc>')

-- remove highlight
map('n', '<esc>', '<cmd>noh<cr>')
map('n', '<leader>h', '<cmd>noh<cr>')

-- keep search results centred
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- format
-- map('n', '<leader>f', '<cmd>retab<cr>')

-- qq to record in q, Q to play
map('n', 'Q', '@q')

-- mm to mark in m, M to jump
map('n', 'M', '`')

-- split
map('n', 'ss', '<cmd>sp<cr><c-w>k<cmd>bp<cr>')
map('n', 'vv', '<cmd>vsp<cr><c-w>h<cmd>bp<cr>')

-- stop copy in last char
map('v', 'y', 'ygv<esc>')

-- indent
map('n', '>', '>>')
map('n', '<', '<<')
map('v', '>', '>gv')
map('v', '<', '<gv')

-- next and prev auto-complete
map('n', '<c-k>', '<cmd>cnext<cr>zz')
map('n', '<c-j>', '<cmd>cprev<cr>zz')

-- navigation panels
map('n', '<c-h>', '<c-w>h')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')

-- tmux
-- map('n', '<c-h>', '<cmd>lua require("tmux").move_left()<cr>')
-- map('n', '<c-j>', '<cmd>lua require("tmux").move_down()<cr>')
-- map('n', '<c-k>', '<cmd>lua require("tmux").move_up()<cr>')
-- map('n', '<c-l>', '<cmd>lua require("tmux").move_right()<cr>')

-- move panels
map('n', '<c-w>h', '<c-w>H')
map('n', '<c-w>j', '<c-w>J')
map('n', '<c-w>k', '<c-w>K')
map('n', '<c-w>l', '<c-w>L')

-- resize
map('n', '<up>', '<cmd>resize +2<cr>')
map('n', '<down>', '<cmd>resize -2<cr>')
map('n', '<left>', '<cmd>vertical resize +2<cr>')
map('n', '<right>', '<cmd>vertical resize -2<cr>')

-- buffer
map('n', '<leader>n', '<cmd>ene<cr>')
map('n', '<leader>w', '<cmd>bd<cr>')
map('n', '<a-n>', '<cmd>ene<cr>')
map('n', '<a-l>', '<cmd>bn<cr>')
map('n', '<a-h>', '<cmd>bp<cr>')
map('n', '<a-w>', '<cmd>bd<cr>')

-- menu
map('i', '<c-space>', '<c-n>')
map('i', '<c-j>', 'pumvisible() ? "\\<c-n>" : "\\<c-j>"', { expr = true })
map('i', '<c-k>', 'pumvisible() ? "\\<c-p>" : "\\<c-k>"', { expr = true })
map('i', '<c-c>', 'pumvisible() ? "\\<c-e>" : "\\<c-c>"', { expr = true })
map('c', '<c-j>', 'pumvisible() ? "\\<c-n>" : "\\<c-j>"', { expr = true })
map('c', '<c-k>', 'pumvisible() ? "\\<c-p>" : "\\<c-k>"', { expr = true })
map('c', '<c-c>', 'pumvisible() ? "\\<c-e>" : "\\<c-c>"', { expr = true })

-- save
map('n', '<c-s>', '<cmd>w!<cr>', { silent = false })
map('i', '<c-s>', '<esc><cmd>w!<cr>', { silent = false })
map('v', '<c-s>', '<esc><cmd>w!<cr>', { silent = false })

-- quit
map('n', '<leader>q', '<cmd>q!<cr>')

------------------------------------------------------------
-- Plugins
------------------------------------------------------------

-- coc
-- map('n', '<leader>f', '<cmd>CocCommand prettier.formatFile<cr>')
-- map('i', '<c-space>', '<cmd>coc#refresh()<cr>', { expr = true })
-- map('i', '<c-j>', '<cmd>CocNext<cr>', { expr = true })
-- map('i', '<c-k>', '<cmd>CocPrev<cr>', { expr = true })

-- hop
map('n', '<leader>f', '<cmd>HopChar1<cr>')

-- nvimtree
map('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')
-- map('n', '<leader>e', '<cmd>Vex<cr>')

-- packer
-- disable to faste paste clipboard
-- map('n', '<leader>pc', '<cmd>PackerCompile<cr>')
-- map('n', '<leader>pi', '<cmd>PackerInstall<cr>')
-- map('n', '<leader>ps', '<cmd>PackerSync<cr>')
-- map('n', '<leader>pS', '<cmd>PackerStatus<cr>')
-- map('n', '<leader>pu', '<cmd>PackerUpdate<cr>')

-- telescope
map('n', '<c-p>', '<cmd>Telescope find_files<cr>')
map('n', '<leader>g', '<cmd>Telescope git_files<cr>')

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

-- references
-- https://github.com/LunarVim/LunarVim/blob/rolling/lua/lvim/keymappings.lua
-- https://github.com/AstroNvim/AstroNvim/blob/main/lua/core/mappings.lua
-- https://github.com/NvChad/NvChad/blob/main/lua/core/mappings.lua
-- https://github.com/AstroNvim/AstroNvim/blob/53d210d3905f65b9e8f0bdb0c8a307440ebfc3f8/lua/core/utils/init.lua
-- https://stackoverflow.com/questions/18948491/running-python-code-in-vim
