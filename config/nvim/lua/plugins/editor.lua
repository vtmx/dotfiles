return {
  {
    'echasnovski/mini.align',
    event = 'ModeChanged', config = true
  },
  {
    'echasnovski/mini.surround',
    event = 'ModeChanged',
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
    cmd = 'HopChar1', config = true
  }
}
