------------------------------------------------------------
-- settings
------------------------------------------------------------

local cmd = vim.cmd

local onedarkpro = require('onedarkpro')
onedarkpro.setup {
  theme = 'onedark',
  colors = {
	  bg = '#23272e',
	  cursorline = '#2c313c',
  },
	hlgroups = {
		NvimTreeNormalNC = { bg = '${bg}' },
		NvimTreeRootFolder = { fg = '#abb2bf' },
		NvimTreeFolder = { fg = '#abb2bf' },
		VertSplit = { fg = '#393e48' },
		CursorLineNr = { fg = '#abb2bf' },
	 	Pmenu = { bg = '#1e2227' },
	 	PmenuSel = { bg = '#2c313a', fg = '#abb2bf' },
	 	PmenuSbar = { bg = '#282c34' },
	 	PmenuThumb = { bg = '#363b46' },
	 	Visual = { bg = '#3d4556' }
	 },
	 options = {
		 highlight_cursorline = true
   }
}
onedarkpro.load()

-- Force Vim Styles
-- :hi to see colors

-- comments
-- cmd [[highlight comment gui=italic]]

-- menu
-- cmd [[hi Pmenu guibg=#1e2227]]
-- cmd [[hi PmenuSel guibg=#2c313a guifg=#abb2bf]]

-- nao sei
--cmd([[highlight WildMenu guibg=#1e2227]])

-- color line
-- cmd [[hi CursorLineNr guibg=#abb2bf]]

-- scroll
-- cmd [[hi PmenuSbar guibg=#282c34]]
-- cmd [[hi PmenuThumb guibg=#363b46]]
--
-- selection
--cmd([[hi Visual guibg=#3d4556]])

-- make transparent bg
-- cmd [[hi! Normal ctermbg=none guibg=none]]
-- cmd [[hi! NonText ctermbg=none guibg=none guifg=none ctermfg=none]]

-- cmd [[hi IndentBlanklineIndent1 guifg=#e5c07b gui=nocombine]]
-- cmd [[hi IndentBlanklineIndent2 guifg=#c678dd gui=nocombine]]
-- cmd [[hi IndentBlanklineIndent3 guifg=#61afef gui=nocombine]]
-- cmd [[hi IndentBlanklineIndent4 guifg=#56b6c2 gui=nocombine]]
-- cmd [[hi IndentBlanklineIndent5 guifg=#d19a66 gui=nocombine]]
-- cmd [[hi IndentBlanklineIndent6 guifg=#abb2bf gui=nocombine]]

-- cmd[[ hi ActiveWindow guibg=#ff0000 ]]
-- cmd[[ hi InactiveWindow guibg=#00ff00 ]]
