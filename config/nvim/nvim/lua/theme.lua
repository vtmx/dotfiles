-----------------------------------------------------------
-- theme
------------------------------------------------------------

local cmd = vim.cmd
local c = require('colors')

local onedarkpro = require('onedarkpro')
onedarkpro.setup {
  theme = 'onedark',
	colors = {
	  bg = c.shade0
  },
	options = {
		italic = false,
	}
}
onedarkpro.load()

-- make transparent bg
-- cmd('hi! Normal guibg=none ctermbg=none')
-- cmd('hi! NonText guibg=none guifg=none ctermbg=none ctermfg=none')

-- bg
cmd('hi Normal guibg=' .. c.shade0)

-- cursor line
cmd('hi CursorLine guibg=' .. c.shade4)

-- line column
cmd('hi LineNR guibg=' .. c.shade0)
cmd('hi LineNR guifg=' .. c.shade3)
cmd('hi CursorLineNr guibg=' .. c.shade0)
cmd('hi CursorLineNr guifg=' .. c.shade7)

-- select text
cmd('hi Visual guibg='..c.shade2)

-- menu pmenu
cmd('hi Pmenu guibg=' .. c.shade1)
cmd('hi PmenuSbar guibg=' .. c.shade1)
cmd('hi PmenuSel guibg=' .. c.shade2)
cmd('hi PmenuSel guifg=' .. c.shade7)
cmd('hi PmenuThumb guibg=' .. c.shade2)

-- line vertical
cmd('hi VertSplit guibg=' .. c.shade0) -- line
cmd('hi VertSplit guifg=' .. c.shade0) -- line
-- cmd('hi VertSplit guibg=' .. c.shade2)
-- cmd('hi VertSplit guifg=' .. c.shade0)
-- cmd('hi StatusLineNC guibg=' .. c.shade2)
-- cmd('hi StatusLineNC guifg=' .. c.shade0)

-- hi comments
cmd('hi comment gui=italic guifg=' .. c.shade3)

-- hop
cmd('hi HopNextKey guibg=none guifg=' .. c.accent0)
cmd('hi HopUnmatched guifg=' .. c.shade3)

-- indent-line
cmd('hi IndentBlanklineChar guifg=' .. c.shade2)
cmd('hi IndentBlanklineSpaceChar guibg=none')

-- nvim-tree
cmd('hi NvimTreeFolder guifg=' .. c.shade7)
cmd('hi NvimTreeFolderIcon guifg=' .. c.shade7)
cmd('hi NvimTreeFolderName guifg=' .. c.shade7)
cmd('hi NvimTreeEmptyFolderName guifg=' .. c.shade7)
cmd('hi NvimTreeOpenedFolderName guifg=' .. c.shade7)
cmd('hi NvimTreeNormal guibg=' .. c.shade1)
cmd('hi NvimTreeNormalNC guibg=' .. c.shade1)
cmd('hi NvimTreeRootFolder guifg=' .. c.shade7)
cmd('hi NvimTreeOpenedFile guifg=' .. c.shade7)
cmd('hi NvimTreeWindowPicker guifg=' .. c.shade7)
-- cmd('hi NvimTreeVertSplit guibg=' .. c.shade1) line
-- cmd('hi NvimTreeVertSplit guifg=' .. c.shade1) line

-- :hi to see colors
