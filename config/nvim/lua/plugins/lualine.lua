local c = require('config.colors')

local onedarkv = ({
  normal = {
    a = { fg = c.fg, bg = 'NONE' },
    b = { fg = c.comment }, z = { fg = c.comment },
  },

  insert = {
    a = { fg = c.fg, bg = 'NONE' },
    b = { fg = c.comment }, z = { fg = c.comment },
  },

  visual = {
    a = { fg = c.fg, bg = 'NONE' },
    b = { fg = c.comment }, z = { fg = c.comment },
  },

  replace = {
    a = { fg = c.fg, bg = 'NONE' },
    b = { fg = c.comment }, z = { fg = c.comment },
  },

  inactive = {
    a = { fg = c.comment, bg = 'NONE' },
    b = { fg = c.comment }, z = { fg = c.comment },
  },
})

return {
  'nvim-lualine/lualine.nvim',
  event = 'BufRead',
  dependencies = 'kyazdani42/nvim-web-devicons',
  opts = {
    options = {
      theme = onedarkv,
      icons_enabled = true,
      component_separators = {},
      section_separators = {},
      disabled_filetypes = {},
      always_divide_middle = true,
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = { 'filename' },
      lualine_x = {},
      lualine_y = { 'filetype' },
      lualine_z = { 'location' }
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
}
