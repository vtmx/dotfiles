local c = require('config.colors')

return {
  'akinsho/bufferline.nvim',
  dependencies = 'kyazdani42/nvim-web-devicons',
  event = 'BufAdd',
  opts = {
    options = {
      buffer_close_icon = '',
      close_icon = '',
      indicator = { icon = '', style = 'none' },
      left_trunc_marker = '',
      modified_icon = '',
      numbers = 'none',
      offsets = {
        {
          filetype = 'NvimTree',
          text = '',
          text_align = "left"
        },
      },
      right_trunc_marker = '',
      separator_style = { '', '' },
      show_buffer_icons = false,
      show_close_icon = false,
      tab_size = 30,
    },
    highlights = {
      background = { fg = c.fgd, bg = 'NONE' },
      buffer = { bg = 'NONE', fg = c.fgd },
      buffer_visible = { bg = 'NONE', fg = c.fgd },
      buffer_selected = { bg = 'NONE', fg = c.fg, bold = false, italic = false },
      close_button = { fg = 'NONE', bg = 'NONE' },
      close_button_visible = { fg = 'NONE', bg = 'NONE' },
      close_button_selected = { fg = 'NONE', bg = 'NONE' },
      fill = { bg = 'NONE' },
      group_separator = { bg = 'NONE' },
      group_label = { bg = 'NONE' },
      indicator_selected = { bg = 'NONE', fg = 'NONE' },
      indicator_visible = { bg = 'NONE', fg = 'NONE' },
      modified = { bg = 'NONE', fg = c.fgd },
      modified_selected = { bg = 'NONE', fg = c.fg },
      separator = { bg = 'NONE', fg = 'NONE' },
      separator_selected = { bg = 'NONE', fg = 'NONE' },
      separator_visible = { bg = 'NONE', fg = 'NONE' },
      tab = { bg = 'NONE' },
      tab_selected = { bg = 'NONE' },
    }
  }
}
