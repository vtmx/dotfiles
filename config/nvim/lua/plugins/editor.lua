return {
  {
    'nvim-mini/mini.align',
    event = 'ModeChanged', config = true
  },
  {
    'nvim-mini/mini.files',
    event = 'ModeChanged',
    config = function()
      require('mini.files').setup({
        mappings = {
          go_in_plus = '<cr>'
        },
        options = {
          use_as_default_explorer = true,
        }
      })
    end
  },
  -- {
  --   'nvim-mini/mini.pairs',
  --   event = 'ModeChanged', config = true
  -- },
  -- {
  --   'nvim-mini/mini.indentscope',
  --   event = 'ModeChanged',
  --   opts = {
  --     priority = 2,
  --     symbol = '│',
  --     draw = { animation = function() return 0 end }
  --   }
  -- },
  {
    'nvim-mini/mini.surround',
    event = 'ModeChanged',
    config = function()
      require('mini.surround').setup({
        search_method = 'cover_or_nearest',
        mappings = { add = 'sa', delete = 'ds', replace = 'cs', highlight = 'sh' }
      })
    end
  },
  {
    'folke/snacks.nvim',
    event = 'ModeChanged',
    opts = {
      indent = {
        enabled = true,
        priority = 2,
        animate = { enabled = false },
      }
    },
  },
  {
    'phaazon/hop.nvim',
    cmd = 'HopChar1', config = true
  },
  {
    'folke/zen-mode.nvim',
    cmd = 'ZenMode',
    opts = {
      window = {
        width = 50, height = 1,
        options = { cursorline = false, number = false, relativenumber = false }
      },
      plugins = { twilight = { enabled = true }, kitty = { enabled = true, font = "+4" } }
    }
  }
}
