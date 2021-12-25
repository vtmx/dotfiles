------------------------------------------------------------
-- bufferline
------------------------------------------------------------

-- :h bufferline-styling
local c = require('colors')
-- vim.api.nvim_echo({{c.shade0, 'None'}}, false, {})

require('bufferline').setup({
  options = {
		-- buffer_close_icon = ' ',
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
			gui = '' -- no italic
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
