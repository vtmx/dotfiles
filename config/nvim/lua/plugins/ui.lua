local c = require('config.colors')

local lualine_map = {
  ['NORMAL']    = 'NOR', ['O-PENDING'] = 'OPE',
  ['INSERT']    = 'INS', ['VISUAL']    = 'VIS',
  ['V-BLOCK']   = 'VIS', ['V-LINE']    = 'VIS',
  ['V-REPLACE'] = 'VIS', ['REPLACE']   = 'REP',
  ['COMMAND']   = 'COM', ['SHELL']     = 'SHE',
  ['TERMINAL']  = 'TER', ['EX']        = 'EX',
  ['S-BLOCK']   = 'SBL', ['S-LINE']    = 'SLI',
  ['SELECT']    = 'SEL', ['CONFIRM']   = 'CON',
  ['MORE']      = 'MOR',
}

local lualine_theme = ({
  normal   = { a = { fg = c.fg, bg = 'NONE' }, b = { fg = c.fd }, z = { fg = c.fd }, },
  insert   = { a = { fg = c.fg, bg = 'NONE' }, b = { fg = c.fd }, z = { fg = c.fd }, },
  visual   = { a = { fg = c.fg, bg = 'NONE' }, b = { fg = c.fd }, z = { fg = c.fd }, },
  replace  = { a = { fg = c.fg, bg = 'NONE' }, b = { fg = c.fd }, z = { fg = c.fd }, },
  inactive = { a = { fg = c.fd, bg = 'NONE' }, b = { fg = c.fd }, z = { fg = c.fd }, },
})

return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'VeryLazy',
    opts = {
      indent = { priority = 2 },
      scope = { enabled = false, priority = 1 }
    }
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    event = 'ModeChanged',
    opts = {
      options = {
        always_divide_middle = true,
        component_separators = {},
        disabled_filetypes = {},
        icons_enabled = true,
        section_separators = {},
        theme = lualine_theme,
      },
      sections = {
        lualine_a = { { 'mode', fmt = function(s) return lualine_map[s] or s end } },
        lualine_b = { 'branch' },
        -- lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_a = {}, lualine_b = {}, lualine_c = {},
        lualine_x = {}, lualine_y = {}, lualine_z = {}
      },
      tabline = {}, extensions = {}
    }
  }
}
