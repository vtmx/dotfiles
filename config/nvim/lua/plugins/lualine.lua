------------------------------------------------------------
-- lualine
------------------------------------------------------------

local onedark = {
  normal = {
    a = { bg = '#23272e', fg = '#abb2bf' },
    c = { bg = '#23272e', fg = '#abb2bf' },
  },

  insert = {
    a = { bg = '#23272e', fg = '#abb2bf' },
    c = { bg = '#23272e', fg = '#abb2bf' },
  },

  visual = {
    a = { bg = '#23272e', fg = '#abb2bf' },
    c = { bg = '#23272e', fg = '#abb2bf' },
  },

  replace = {
    a = { bg = '#23272e', fg = '#abb2bf' },
    c = { bg = '#23272e', fg = '#abb2bf' },
  },

  inactive = {
    a = { bg = '#23272e', fg = '#23272e' },
    c = { bg = '#23272e', fg = '#23272e' },
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
