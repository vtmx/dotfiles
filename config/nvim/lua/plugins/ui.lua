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
  normal = { a = { fg = c.fg, bg = 'NONE' }, b = { fg = c.fgd }, z = { fg = c.fgd }, },
  insert = { a = { fg = c.fg, bg = 'NONE' }, b = { fg = c.fgd }, z = { fg = c.fgd }, },
  visual = { a = { fg = c.fg, bg = 'NONE' }, b = { fg = c.fgd }, z = { fg = c.fgd }, },
  replace = { a = { fg = c.fg, bg = 'NONE' }, b = { fg = c.fgd }, z = { fg = c.fgd }, },
  inactive = { a = { fg = c.fgd, bg = 'NONE' }, b = { fg = c.fgd }, z = { fg = c.fgd }, },
})

return {
  {
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
        offsets = { { filetype = 'NvimTree', text = '', text_align = "left" } },
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
  },
  {
    'kyazdani42/nvim-web-devicons',
    event = 'VeryLazy'
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'VeryLazy',
    opts = { scope = { enabled = false } }
  },
  {
    'nvim-lualine/lualine.nvim',
    event = 'BufEnter',
    dependencies = 'kyazdani42/nvim-web-devicons',
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
      tabline = {},
      extensions = {}
    }
  }
}
