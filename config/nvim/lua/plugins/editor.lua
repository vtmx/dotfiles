return {
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
        kitty = { enabled = true, font = '+4' }
      }
    }
  }
}
