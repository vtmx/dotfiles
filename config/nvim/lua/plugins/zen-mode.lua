return {
  'folke/zen-mode.nvim',
  event = 'VeryLazy',
  opts = {
    window = {
      width = 80,
      options = {
        cursorline = false,
        number = false,
        relativenumber = false
      }
    },
    plugins = {
      twilight = { enabled = true },
      kitty = {
        enabled = true,
        font = "+4"
      }
    }
  }
}

