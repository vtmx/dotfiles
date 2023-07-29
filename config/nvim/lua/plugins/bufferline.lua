local c = require('config.colors')

return {
  'akinsho/bufferline.nvim',
  dependencies = 'kyazdani42/nvim-web-devicons',
  opts = {
    options = {
      buffer_close_icon = '',
      numbers = 'none',
      buffer_close_icon = '',
      modified_icon = '',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
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
      fill = { bg = 'NONE' },
      group_separator = { bg = 'NONE' },
      group_label = { bg = 'NONE' },
      tab = { bg = 'NONE' },
      tab_selected = { bg = 'NONE' },
      close_button = { fg = 'NONE', bg = 'NONE' },
      close_button_visible = { fg = 'NONE', bg = 'NONE' },
      close_button_selected = { fg = 'NONE', bg = 'NONE' },
      background = { fg = c.comment, bg = 'NONE' },
      buffer = { bg = 'NONE', fg = c.comment },
      buffer_visible = { bg = 'NONE', fg = c.comment },
      buffer_selected = { bg = 'NONE', fg = c.fg, bold = false, italic = false },
      modified = { bg = 'NONE', fg = c.comment },
      modified_selected = { bg = 'NONE', fg = c.fg },
      separator = { bg = 'NONE', fg = 'NONE' },
      separator_selected = { bg = 'NONE', fg = 'NONE' },
      separator_visible = { bg = 'NONE', fg = 'NONE' },
      indicator_selected = { bg = 'NONE', fg = 'NONE' },
      indicator_visible = { bg = 'NONE', fg = 'NONE' }
    }
  }
}
