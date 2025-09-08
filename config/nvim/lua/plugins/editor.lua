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
