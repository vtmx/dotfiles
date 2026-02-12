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
    event = 'ModeChanged',
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

            -- Troca o nome do modo
            filename = '%t'
            location = '%l:%c'

            if mode == 'Command' then mode  = 'CMD' end
            if mode == 'Insert' then mode   = 'INS' end
            if mode == 'Normal' then mode   = 'NOR' end
            if mode == 'Prompt' then mode   = 'PRO' end
            if mode == 'Replace' then mode  = 'REP' end
            if mode == 'S-Block' then mode  = 'SEL' end
            if mode == 'Select' then mode   = 'SEL' end
            if mode == 'Shell' then mode    = 'SHE' end
            if mode == 'S-Line' then mode   = 'SEL' end
            if mode == 'Terminal' then mode = 'TER' end
            if mode == 'V-Block' then mode  = 'VIS' end
            if mode == 'Visual' then mode   = 'VIS' end
            if mode == 'V-Line' then mode   = 'VIS' end

            return statusline.combine_groups({
              { hl = 'Normal', strings = { mode } },
              { hl = 'Comment', strings = { git } },
              '%<',            -- Mark general truncate point
              { hl = 'Comment', strings = { filename } },
              '%=',            -- End left alignment
              { hl = 'Normal', strings = { search } },
              { hl = 'Comment',strings = { location } },
            })
          end,
          inactive = nil,
        },
        use_icons = false,
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
