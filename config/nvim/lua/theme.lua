-----------------------------------------------------------
-- theme
------------------------------------------------------------

local cmd = vim.cmd
local c = require('colors')
local onedarkpro = require('onedarkpro')

onedarkpro.setup {
  theme = 'onedark',
	colors = {
	  bg = c.shade0,
  },
	hlgroups = {
		VertSplit = { bg = c.shade0, fg = c.shade3 }
	},
	options = {
		italic = false,
	}
}

onedarkpro.load()

-- make bg transparent 
-- cmd('hi! Normal guibg=none ctermbg=none')
-- cmd('hi! NonText guibg=none guifg=none ctermbg=none ctermfg=none')

-- bg
--cmd('hi Normal guibg=' .. c.shade0)

-- line tilde blank
cmd('hi EndOfBuffer guifg=' .. c.shade0)

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

-- line splits
cmd('hi VertSplit guibg=' .. c.shade0)
cmd('hi VertSplit guifg=' .. c.shade3)

-- status line
cmd('hi StatusLine guibg=' .. c.shade0)
cmd('hi StatusLine guifg=' .. c.shade3)
cmd('hi StatusLineNC guibg=' .. c.shade0)
cmd('hi StatusLineNC guifg=' .. c.shade3)

-- hi comments
cmd('hi comment gui=italic guifg=' .. c.shade3)

-- hop
cmd('hi HopNextKey guibg=none guifg=' .. c.accent0)
cmd('hi HopUnmatched guifg=' .. c.shade3)

-- indent-line
cmd('hi IndentBlanklineChar guifg=' .. c.shade2)
cmd('hi IndentBlanklineSpaceChar guibg=none')

-- nvim-tree
cmd('hi NvimTreeVertSplit guibg=' .. c.shade0)
cmd('hi NvimTreeVertSplit guifg=' .. c.shade0)
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

-- :hi to see colors

-- plugins

------------------------------------------------------------
-- bufferline
------------------------------------------------------------

require('bufferline').setup({
  options = {
		buffer_close_icon = ' ',
		close_icon = ' ',
		indicator_icon = ' ',
		separator_style = {'', ''},
		show_close_icon = false,
		show_buffer_icons = false,
		tab_size = 30,
		offsets = {
      {
        filetype = 'NvimTree',
        text = '',
        text_align = "left"
      },
		}
	},
	highlights = {
		fill = {
			guibg = c.shade1
		},
		background = {
			guibg = c.shade1
		},
		close_button = {
			guibg = c.shade1,
			guifg = c.shade3
		},
		close_button_selected = {
			guibg = c.shade0,
			guifg = c.shade7
		},
		buffer_visible = {
			guibg = c.shade1,
			guifg = c.shade7
		},
		buffer_selected = {
			guibg = c.shade0,
			guifg = c.shade7,
			-- gui = '' -- no italic
		},
		modified = {
			guifg = c.shade3
		},
		modified_selected = {
			guifg = c.shade7
		},
		separator = {
			guibg = c.shade1,
			guifg = c.shade1
		}
	}
})

------------------------------------------------------------
-- lualine
------------------------------------------------------------

local onedark = {
  normal = {
    a = { bg = c.shade0, fg = c.shade7 },
    c = { bg = c.shade0, fg = c.shade7 },
  },

  insert = {
    a = { bg = c.shade0, fg = c.shade7 },
    c = { bg = c.shade0, fg = c.shade7 },
  },

  visual = {
    a = { bg = c.shade0, fg = c.shade7 },
    c = { bg = c.shade0, fg = c.shade7 },
  },

  replace = {
    a = { bg = c.shade0, fg = c.shade7 },
    c = { bg = c.shade0, fg = c.shade7 },
  },

  inactive = {
    a = { bg = c.shade0, fg = c.shade0 },
    c = { bg = c.shade0, fg = c.shade0 },
  },
}

require('lualine').setup {
  options = {
		theme = onedark,
    icons_enabled = true,
    component_separators = {},
    section_separators = {},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
