-- onedarkpro
local onedarkpro = require('onedarkpro')
onedarkpro.setup({
  theme = 'onedark',
  colors = {
	  bg = '#23272e',
	  cursorline = '#262a32'
  }, 
  styles = {
      comments = 'italic',
  },
  opations = {
	  highlight_cursorline = true
  }
})
onedarkpro.load()

-- lualine
require'lualine'.setup {
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
