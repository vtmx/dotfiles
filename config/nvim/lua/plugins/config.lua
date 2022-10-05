------------------------------------------------------------
-- config
------------------------------------------------------------

local c = require('colors')

------------------------------------------------------------
-- onedark
------------------------------------------------------------

-- require('onedarkpro').load()
require('onedark').load()

------------------------------------------------------------
-- bufferline
------------------------------------------------------------

require('bufferline').setup({
  options = {
    buffer_close_icon = '',
    modified_icon = '',
    close_icon = '',
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
    fill = {
      bg = c.shade0
    },
    background = {
      bg = c.shade0
    },
    close_button = {
      bg = c.shade0,
      fg = c.shade3
    },
    close_button_selected = {
      bg = c.shade0,
      fg = c.shade7
    },
    buffer = {
      bg = c.shade0,
      fg = c.shade7
    },
    buffer_visible = {
      bg = c.shade0,
      fg = c.shade7
    },
    buffer_selected = {
      bg = c.shade0,
      fg = c.shade7,
      bold = false,
      italic = false
    },
    modified = {
      fg = c.shade3
    },
    modified_selected = {
      fg = c.shade7
    },
    separator = {
      bg = c.shade0,
      fg = c.shade0
    }
  }
})

------------------------------------------------------------
-- lualine
------------------------------------------------------------

local onedarkv = {
  normal = {
    a = { bg = 'NONE', fg = c.shade7 },
    c = { bg = 'NONE', fg = c.shade7 },
  },

  insert = {
    a = { bg = 'NONE', fg = c.shade7 },
    c = { bg = 'NONE', fg = c.shade7 },
  },

  visual = {
    a = { bg = 'NONE', fg = c.shade7 },
    c = { bg = 'NONE', fg = c.shade7 },
  },

  replace = {
    a = { bg = 'NONE', fg = c.shade7 },
    c = { bg = 'NONE', fg = c.shade7 },
  },

  inactive = {
    a = { bg = 'NONE', fg = c.shade0 },
    c = { bg = 'NONE', fg = c.shade0 },
  },
}

require('lualine').setup({
  options = {
    theme = onedarkv,
    icons_enabled = true,
    component_separators = {},
    section_separators = {},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {},
    lualine_c = {},
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
})

-- comment
require('Comment').setup()

-- indent-blankline
require('indent_blankline').setup({ 
  filetype_exclude = {'dashboard', 'help', 'terminal'}
})

-- hop
require('hop').setup()

-- nvim-tree
require('nvim-tree').setup({
  disable_netrw = false,
  hijack_netrw = false,
  actions = {
    open_file = {
      quit_on_open = true,
    }
  },
  view = {
    width = 30,
    hide_root_folder = true,
  }
})

-- treesitter
require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
})

-- telescope
local telescope_actions = require('telescope.actions')

require('telescope').setup({
  defaults = {
    disable_devicons=true,
    sorting_strategy = 'ascending',
    layout_config = {
      horizontal = {
        prompt_position = 'top',
      },
    },
    mappings = {
      n = {
        ['<c-c>'] = telescope_actions.close
      },
      i = {
        ['<c-j>'] = telescope_actions.move_selection_next,
        ['<c-k>'] = telescope_actions.move_selection_previous,
        ['<c-c>'] = telescope_actions.close
      }
    }
  }
})

-- treesitter
require('nvim-treesitter.install').update({ with_sync = true })

-- autopairs and autotag
require('nvim-autopairs').setup()

-- instructions
-- coc
--:CocInstall coc-eslint
--:CocInstall coc-emmet
--:CocInstall coc-pairs
--:CocInstall coc-snippets
--:CocInstall coc-prettier
--:CocInstall coc-vetur

-- treesitter
-- :TSInstall vue javascript typescript html css scss

