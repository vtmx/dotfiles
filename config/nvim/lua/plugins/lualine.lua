local c = require('colors')

local onedarkv = ({
  normal = {
    a = { fg = c.shade7, bg = 'NONE' },
    b = { fg = c.shade3 }, z = { fg = c.shade3 },
  },

  insert = {
    a = { fg = c.shade7, bg = 'NONE' },
    b = { fg = c.shade3 }, z = { fg = c.shade3 },
  },

  visual = {
    a = { fg = c.shade7, bg = 'NONE' },
    b = { fg = c.shade3 }, z = { fg = c.shade3 },
  },

  replace = {
    a = { fg = c.shade7, bg = 'NONE' },
    b = { fg = c.shade3 }, z = { fg = c.shade3 },
  },

  inactive = {
    a = { fg = c.shade3, bg = 'NONE' },
    b = { fg = c.shade3 }, z = { fg = c.shade3 },
  },
})

return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'kyazdani42/nvim-web-devicons'
  },
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
      lualine_c = {},
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
