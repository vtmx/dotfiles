-----------------------------------------------------------
-- theme
------------------------------------------------------------

-- :hi to see colors

local cmd = vim.cmd
local c = require('colors')

local onedarkpro = require('onedarkpro')
onedarkpro.setup {
  theme = 'onedark',
	colors = {
	  bg = c.shade0
  }
}
onedarkpro.load()

-- make transparent bg
-- cmd('hi! Normal guibg=none ctermbg=none')
-- cmd('hi! NonText guibg=none guifg=none ctermbg=none ctermfg=none')

-- bg
cmd('hi Normal guibg='..c.shade0)

-- cursor line
cmd('hi CursorLine guibg=#2c313c')

-- line column
cmd('hi LineNR guibg=#23272e guifg=#5c6370')
cmd('hi CursorLineNr guibg=#23272e guifg=#abb2bf')

-- select text
cmd('hi Visual guibg=#3d4556')

-- menu pmenu
cmd('hi Pmenu guibg=#1e2227')
cmd('hi PmenuSbar guibg=#282c34')
cmd('hi PmenuSel guibg=#2c313a guifg=#abb2bf')
cmd('hi PmenuThumb guibg=#363b46')

-- line vertical
cmd('hi VertSplit guibg=#23272e guifg=#23272e') -- line
-- cmd('hi VertSplit guibg=#393e48 guifg=#23272e') line
-- cmd('hi StatusLineNC guibg=#393e48 guifg=#23272e')

-- hi comments
cmd('hi comment gui=italic guifg=#5c6370')

-- hop
cmd('hi HopNextKey guibg=none guifg=#e06c75')
cmd('hi HopUnmatched guifg=#5c6370')

-- indent-line
cmd('hi IndentBlanklineChar guifg=#393e48')
cmd('hi IndentBlanklineSpaceChar guibg=none')

-- nvim-tree
cmd('hi NvimTreeFolder guifg=#abb2bf')
cmd('hi NvimTreeFolderIcon guifg=#abb2bf')
cmd('hi NvimTreeFolderName guifg=#abb2bf')
cmd('hi NvimTreeEmptyFolderName guifg=#abb2bf')
cmd('hi NvimTreeOpenedFolderName guifg=#abb2bf')
cmd('hi NvimTreeNormal guibg=#1e2227')
cmd('hi NvimTreeNormalNC guibg=#1e2227')
cmd('hi NvimTreeRootFolder guifg=#abb2bf')
cmd('hi NvimTreeOpenedFile guifg=#abb2bf')
cmd('hi NvimTreeWindowPicker guifg=#abb2bf')
-- cmd('hi NvimTreeVertSplit guibg=#1e2227 guifg=#1e2227') line
