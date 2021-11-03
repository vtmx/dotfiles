------------------------------------------------------------
-- bufferline
------------------------------------------------------------
-- :h bufferline-styling

local bg = '#1e2227'
local bg_selected = '#23272e'

require('bufferline').setup({
  options = {
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
			guibg = '#1e2227'
		},
		background = {
			guibg = '#1e2227'
		},
		close_button = {
			guibg = '#1e2227',
			guifg = '#5c6370'
		},
		close_button_selected = {
			guibg = '#23272e',
			guifg = '#abb2bf'
		},
		buffer_visible = {
			guibg = '#1e2227',
			guifg = '#abb2bf'
		},
		buffer_selected = {
			guibg = '#23272e',
			guifg = '#abb2bf',
			gui = '' -- no italic
		},
		modified = {
			guifg = '#5c6370'
		},
		modified_selected = {
			guifg = '#abb2bf'
		},
		separator = {
			guibg = '#1e2227',
			guifg = '#1e2227'
		}
	}
})
