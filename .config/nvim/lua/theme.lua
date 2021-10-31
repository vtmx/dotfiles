local cmd = vim.cmd

local onedarkpro = require('onedarkpro')
onedarkpro.setup({
  theme = 'onedark',
  colors = {
	  bg = '#23272e',
	  cursorline = '#2c313c',
  },
	hlgroups = {
		CursorLineNr = { fg = '#abb2bf' },
	 	Pmenu = { bg = '#1e2227' },
	 	PmenuSel = { bg = '#2c313a', fg = '#abb2bf' },
	 	PmenuSbar = { bg = '#282c34' },
	 	PmenuThumb = { bg = '#363b46' },
	 	Visual = { bg = '#3d4556' }
	 },
   styles = {
   },
	 options = {
		 highlight_cursorline = true
   }
})
onedarkpro.load()

-- lualine
require'lualine'.setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = {},
    section_separators = {},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', {'diagnostics', sources={'nvim_lsp', 'coc'}}},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

-- configure plugins
require'shade'.setup{
  overlay_opacity = 50,
  opacity_step = 1,
  keys = {
    brightness_up    = '<c-up>',
    brightness_down  = '<c-down>',
		toggle           = '<c-left>'
  }
}

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

-- cmd [[highlight IndentBlanklineIndent1 guifg=#e5c07b gui=nocombine]]
-- cmd [[highlight IndentBlanklineIndent2 guifg=#c678dd gui=nocombine]]
-- cmd [[highlight IndentBlanklineIndent3 guifg=#61afef gui=nocombine]]
-- cmd [[highlight IndentBlanklineIndent4 guifg=#56b6c2 gui=nocombine]]
-- cmd [[highlight IndentBlanklineIndent5 guifg=#d19a66 gui=nocombine]]
-- cmd [[highlight IndentBlanklineIndent6 guifg=#abb2bf gui=nocombine]]

