return {
  -- {
  --   'christoomey/vim-tmux-navigator',
  --   event = 'VeryLazy'
  -- },
  {
    'echasnovski/mini.align',
    event = 'VeryLazy',
    config = true
  },
  {
    'echasnovski/mini.surround',
    event = 'VeryLazy',
    config = function()
      require('mini.surround').setup({
         mappings = { add = 'sa', delete = 'ds', replace = 'cs', highlight = 'sh', }
      })
    end
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
  },
  {
    'phaazon/hop.nvim',
    cmd = 'HopChar1',
    config = true
  }
}
