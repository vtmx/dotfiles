------------------------------------------------------------
-- theme
------------------------------------------------------------

local cmd = vim.cmd

local onedarkpro = require('onedarkpro')
onedarkpro.setup {
  theme = 'onedark',
	colors = {
	  bg = '#23272e'
  }
}
onedarkpro.load()

-- nvim styles
-- :hi to see colors

-- make transparent bg
-- cmd('hi! Normal ctermbg=none guibg=none')
-- cmd('hi! NonText ctermbg=none guibg=none guifg=none ctermfg=none')

-- bg
cmd('hi Normal guibg=#23272e')

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
cmd('hi VertSplit guifg=#23272e guibg=#23272e')

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
cmd('hi NvimTreeWindowPicker guibg=#1e2227 guifg=#abb2bf')

-- hi comments
cmd('hi comment gui=italic')

-- bufferline dosen't work
-- cmd('hi BufferLineFill guibg=#ff0000')
-- cmd('hi BufferLineBackground gui=none guibg=#00ff00')

-- multiple indent line
-- cmd('hi IndentBlanklineIndent1 guifg=#e5c07b gui=nocombine')
-- cmd('hi IndentBlanklineIndent2 guifg=#c678dd gui=nocombine')
-- cmd('hi IndentBlanklineIndent3 guifg=#61afef gui=nocombine')
-- cmd('hi IndentBlanklineIndent4 guifg=#56b6c2 gui=nocombine')
-- cmd('hi IndentBlanklineIndent5 guifg=#d19a66 gui=nocombine')
-- cmd('hi IndentBlanklineIndent6 guifg=#abb2bf gui=nocombine')
