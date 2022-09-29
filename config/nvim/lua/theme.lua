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
	highlights = {
		VertSplit = { bg = c.shade0, fg = c.shade2 }
	},
	options = {
		italic = false,
	}
}

onedarkpro.load()

-- :hi to see colors
function hi(group, bg, fg, gui)
	local bg = bg or 'NONE'
	local fg = fg or 'NONE'
	local gui = gui or 'NONE'

	bg = 'guibg=' .. bg
	fg = 'guifg=' .. fg
	gui = 'gui=' .. gui

	cmd('hi ' .. group .. ' ' .. bg .. ' ' .. fg .. ' ' .. gui)
end

-- default
hi('Normal', c.shade0, c.shade7)

-- line tilde blank
hi('EndOfBuffer', 'NONE', c.shade0)

-- cursor line
hi('CursorLine', c.shade4)

-- line column
hi('LineNR', c.shade0, c.shade3)
hi('CursorLineNr', c.shade0, c.shade7)

-- select text
hi('Visual', c.shade2)

-- menu pmenu
hi('Pmenu', c.shade1)
hi('PmenuSbar', c.shade1)
hi('PmenuSel', c.shade2)
hi('PmenuSel', 'NONE', c.shade7)
hi('PmenuThumb', c.shade2)

-- line splits
hi('VertSplit', c.shade0, c.shade2)

-- status line
hi('StatusLine', c.shade0, c.shade3)
hi('StatusLineNC', c.shade0, c.shade3)

-- hi comments
hi('Comment', 'NONE', c.shade3, 'italic')

-- hop
hi('HopNextKey', 'NONE', c.accent0)
hi('HopUnmatched', 'NONE', c.shade3)

-- indent-line
hi('IndentBlanklineChar', 'NONE', c.shade2)
hi('IndentBlanklineSpaceChar')

-- nvim-tree
hi('NvimTreeCursorLine', c.shade4)
hi('NvimTreeVertSplit', c.shade0, c.shade3)
hi('NvimTreeFolder', 'NONE', c.shade7)
hi('NvimTreeFolderIcon', 'NONE', c.shade7)
hi('NvimTreeFolderName', 'NONE', c.shade7)
hi('NvimTreeEmptyFolderName', 'NONE', c.shade7)
hi('NvimTreeOpenedFolderName', 'NONE', c.shade7)
hi('NvimTreeNormal', c.shade0)
hi('NvimTreeNormalNC', c.shade0)
hi('NvimTreeRootFolder', 'NONE', c.shade7)
hi('NvimTreeOpenedFile', 'NONE', c.shade7)
hi('NvimTreeWindowPicker', 'NONE', c.shade7)

-- plugins

------------------------------------------------------------
-- bufferline
------------------------------------------------------------

require('bufferline').setup({
  options = {
		buffer_close_icon = '',
		modified_icon = '',
		close_icon = '',
		indicator = { icon = '', style = 'none' },
		separator_style = { '', '' },
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
			bg = c.shade0
		},
		background = {
			bg = c.shade0
		},
		close_button = {
			bg = c.shade0,
			fg = c.shade3
		},
		close_button_selected = {
			bg = c.shade0,
			fg = c.shade7
		},
		buffer = {
			bg = c.shade0,
			fg = c.shade7
		},
		buffer_visible = {
			bg = c.shade0,
			fg = c.shade7
		},
		buffer_selected = {
			bg = c.shade0,
			fg = c.shade7,
			bold = false,
      italic = false
		},
		modified = {
			fg = c.shade3
		},
		modified_selected = {
			fg = c.shade7
		},
		separator = {
			bg = c.shade0,
			fg = c.shade0
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
