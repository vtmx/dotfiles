------------------------------------------------------------
-- lualine
------------------------------------------------------------

local c = require('colors')

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
    -- lualine_b = {'branch', 'diff', {'diagnostics', sources={'nvim_lsp', 'coc'}}},
    lualine_c = {},
    -- lualine_c = {'filename'},
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
