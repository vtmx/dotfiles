------------------------------------------------------------
-- colors
------------------------------------------------------------

local c = require('colors')

------------------------------------------------------------
-- onedark
------------------------------------------------------------

local status_ok, onedarkpro = pcall(require, 'onedarkpro')
if not status_ok then return end
onedarkpro.setup()

------------------------------------------------------------
-- comment
------------------------------------------------------------

local status_ok, comment = pcall(require, 'Comment')
if not status_ok then return end
comment.setup()

------------------------------------------------------------
-- autopairs
------------------------------------------------------------

local status_ok, nvim_autopairs = pcall(require, 'nvim-autopairs')
if not status_ok then return end
nvim_autopairs.setup()

------------------------------------------------------------
-- indent-blankline
------------------------------------------------------------

local status_ok, indent_blankline = pcall(require, 'indent_blankline')
if not status_ok then return end
indent_blankline.setup({ filetype_exclude = { 'dashboard', 'help', 'terminal' }})

------------------------------------------------------------
-- hop
------------------------------------------------------------

local status_ok, hop = pcall(require, 'hop')
if not status_ok then return end
hop.setup()

------------------------------------------------------------
-- nvim-tree
------------------------------------------------------------

local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then return end

nvim_tree.setup({
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

------------------------------------------------------------
-- telescope
------------------------------------------------------------

local status_ok, telescope = pcall(require, 'telescope')

if not status_ok then
  return
else
  telescope_actions = require('telescope.actions')
end

telescope.setup({
  defaults = {
    disable_devicons = true,
    color_devicons = false,
    sorting_strategy = 'ascending',
    layout_config = {
      horizontal = {
        prompt_position = 'bottom',
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

------------------------------------------------------------
-- treesitter
------------------------------------------------------------

local status_ok, treesitter_config = pcall(require, 'nvim-treesitter.configs')
if not status_ok then return end

treesitter_config.setup({
  autotag = {
    enable = true
  },
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
})

local status_ok, treesitter_install = pcall(require, 'nvim-treesitter.install')
if not status_ok then return end

treesitter_install.update({ with_sync = true })

------------------------------------------------------------
-- bufferline
------------------------------------------------------------

local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then return end

bufferline.setup({
  options = {
    buffer_close_icon = '',
    numbers = 'none',
    buffer_close_icon = '',
    modified_icon = '',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
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
    fill = { bg = 'NONE' },
    group_separator = { bg = 'NONE' },
    group_label = { bg = 'NONE' },
    tab = { bg = 'NONE' },
    tab_selected = { bg = 'NONE' },
    close_button = { fg = 'NONE', bg = 'NONE' },
    close_button_visible = { fg = 'NONE', bg = 'NONE' },
    close_button_selected = { fg = 'NONE', bg = 'NONE' },
    background = { fg = c.shade3, bg = 'NONE' },
    buffer = { bg = 'NONE', fg = c.shade3 },
    buffer_visible = { bg = 'NONE', fg = c.shade3 },
    buffer_selected = { bg = 'NONE', fg = c.shade7, bold = false, italic = false },
    modified = { bg = 'NONE', fg = c.shade3 },
    modified_selected = { bg = 'NONE', fg = c.shade7 },
    separator = { bg = 'NONE', fg = 'NONE' },
    separator_selected = { bg = 'NONE', fg = 'NONE' },
    separator_visible = { bg = 'NONE', fg = 'NONE' },
    indicator_selected = { bg = 'NONE', fg = 'NONE' },
    indicator_visible = { bg = 'NONE', fg = 'NONE' }
  }
})

------------------------------------------------------------
-- lualine
------------------------------------------------------------

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

local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then return end

lualine.setup({
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
})

------------------------------------------------------------
-- instructions
------------------------------------------------------------
-- coc
--:CocInstall coc-eslint
--:CocInstall coc-emmet
--:CocInstall coc-pairs
--:CocInstall coc-snippets
--:CocInstall coc-prettier
--:CocInstall coc-vetur

-- treesitter
-- :TSInstall vue javascript typescript html css scss
