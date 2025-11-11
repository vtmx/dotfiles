return {
  {
    'nvim-mini/mini.align',
    event = 'ModeChanged', config = true
  },
  {
    'nvim-mini/mini.cursorword'
  },
  {
    'nvim-mini/mini.files',
    event = 'ModeChanged',
    config = function()
      require('mini.files').setup({
        mappings = { go_in_plus = '<cr>' },
        options = { use_as_default_explorer = true }
      })
    end
  },
  
  -- {
  --   'nvim-mini/mini.indentscope',
  --   config = function()
  --     require('mini.indentscope').setup({
  --       draw = {
  --         animation = require('mini.indentscope').gen_animation.none(),
  --         delay = 0
  --       },
  --       symbol = '│'
  --     })
  --   end 
  -- },
  {
    'nvim-mini/mini.surround',
    event = 'ModeChanged',
    config = function()
      require('mini.surround').setup({
        search_method = 'cover_or_nearest',
        mappings = { add = 'gsa', delete = 'ds', replace = 'cs', highlight = 'sh' }
      })
    end
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'VeryLazy',
    opts = {
      indent = {
        priority = 2
      },
      scope = {
        enabled = false,
        priority = 2
      }
    }
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
