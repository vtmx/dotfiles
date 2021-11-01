------------------------------------------------------------
-- bufferline
------------------------------------------------------------

require('bufferline').setup {
  options = {
		close_icon = ' ',
		show_buffer_icons = false,
		separator_style = 'thin'
	},
	highlights = {
		fill = {
			 guibg = '#1e2227',
		},
		background = {
			 guibg = '#1e2227',
		},
		tab = {
			 guibg = '#1e2227',
			 guifg = '#1e2227',
		},
		tab_selected = {
			 guibg = '#23272e',
		},
		close_button = {
			 guibg = '#1e2227'
		},
		close_button_selected = {
			 guibg = '#23272e'
		},
		tab_close = {
			 guibg = '#23272e',
		},
		buffer_selected = {
			gui = ''
		},
		separator = {
			 guifg = '#1e2227',
		},
		indicator_selected = {
			 guibg = '#1e2227',
			 guifg = '#1e2227',
		}
	}
}

------------------------------------------------------------
-- nvim-tree
------------------------------------------------------------

require('nvim-tree').setup {
	auto_close = true,
	disable_netrw = false,
	hijack_netrw = false
}

------------------------------------------------------------
-- telescope
------------------------------------------------------------

local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
				['<c-j>'] = actions.move_selection_next,
				['<c-k>'] = actions.move_selection_previous
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

------------------------------------------------------------
-- lualine
------------------------------------------------------------

require('lualine').setup {
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
