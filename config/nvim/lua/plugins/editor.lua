return {
  {
    'nvim-mini/mini.align',
    event = 'VeryLazy',
    config = true
  },
  {
    'nvim-mini/mini.cursorword',
    event = 'VeryLazy',
    config = true
  },
  {
    'nvim-mini/mini.files',
    event = 'VeryLazy',
    config = function()
      require('mini.files').setup({
        mappings = { go_in_plus = '<cr>' },
        options = { use_as_default_explorer = true }
      })
    end
  },
  {
    'nvim-mini/mini.jump2d',
    event = 'VeryLazy',
    config = { view = { dim = true } }
  },
  {
    'nvim-mini/mini.pairs',
    event = 'VeryLazy',
    config = true
  },
  {
    'nvim-mini/mini.surround',
    event = 'VeryLazy',
    config = function()
      require('mini.surround').setup({
        search_method = 'cover_or_nearest',
        mappings = {
          add = 'gsa',
          delete = 'ds',
          replace = 'cs',
          find = '',
          find_left = '',
          highlight = '',
          suffix_last = '',
          suffix_next = ''
        }
      })
    end
  },
  {
    'nvim-mini/mini.statusline',
    event = 'VeryLazy',
    config = function()
      local statusline = require('mini.statusline')
      statusline.setup({
        content = {
          active = function()
            local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
            local git           = statusline.section_git({ trunc_width = 40 })
            local search        = statusline.section_searchcount({ trunc_width = 75 })
            local filename      = statusline.section_filename({ trunc_width = 140 })
            local location      = statusline.section_location({ trunc_width = 75 })

            local mode_abb = {
              ['Command']  = 'CMD',
              ['Insert']   = 'INS',
              ['Normal']   = 'NOR',
              ['Prompt']   = 'PRO',
              ['Replace']  = 'REP',
              ['S-Block']  = 'SEL',
              ['Select']   = 'SEL',
              ['Shell']    = 'SHE',
              ['S-Line']   = 'SEL',
              ['Terminal'] = 'TER',
              ['V-Block']  = 'VIS',
              ['Visual']   = 'VIS',
              ['V-Line']   = 'VIS',
            }
            mode = mode_abb[mode] or mode

            return statusline.combine_groups({
              { hl = 'Normal', strings = { mode } },
              { hl = 'Comment', strings = { git } }, -- to work { 'lewis6991/gitsigns.nvim', config = true },
              '%<', -- Mark general truncate point
              { hl = 'Comment', strings = { '%t' } },
              '%=', -- End left alignment
              { hl = 'Normal', strings = { search } },
              { hl = 'Comment',strings = { '%l:%c' } },
            })
          end,
          inactive = nil,
        }
      })
    end
  },
  {
    'phaazon/hop.nvim',
    cmd = { 'HopChar1', 'HopAnywhere' },
    config = true
  },
  {
    'folke/zen-mode.nvim',
    cmd = 'ZenMode',
    opts = {
      window = {
        width = 50,
        height = 1,
        options = {
          cursorline = false,
          number = false,
          relativenumber = false
        }
      },
      plugins = {
        twilight = { enabled = true },
        kitty = { enabled = true, font = "+4" }
      }
    }
  }
}
