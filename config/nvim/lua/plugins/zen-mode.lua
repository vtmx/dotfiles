return {
  'folke/zen-mode.nvim',
  cmd = 'ZenMode',
  opts = {
    window = {
      width = 60,
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

