local c = require('config.colors')

local onedarkv = ({
  normal = {
    a = { fg = c.fg, bg = 'NONE' },
    b = { fg = c.fgd },
    z = { fg = c.fgd },
  },

  insert = {
    a = { fg = c.fg, bg = 'NONE' },
    b = { fg = c.fgd },
    z = { fg = c.fgd },
  },

  visual = {
    a = { fg = c.fg, bg = 'NONE' },
    b = { fg = c.fgd },
    z = { fg = c.fgd },
  },

  replace = {
    a = { fg = c.fg, bg = 'NONE' },
    b = { fg = c.fgd },
    z = { fg = c.fgd },
  },

  inactive = {
    a = { fg = c.fgd, bg = 'NONE' },
    b = { fg = c.fgd },
    z = { fg = c.fgd },
  },
})

return {
  'nvim-lualine/lualine.nvim',
  event = 'BufRead',
  dependencies = 'kyazdani42/nvim-web-devicons',
  opts = {
    options = {
      always_divide_middle = true,
      component_separators = {},
      disabled_filetypes = {},
      icons_enabled = true,
      section_separators = {},
      theme = onedarkv,
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = { 'filename' },
      lualine_x = {},
      lualine_y = {},
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
