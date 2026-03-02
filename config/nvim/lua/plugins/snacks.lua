return {
  'folke/snacks.nvim',
  priority = 1000,
  opts = {
    exclude = { '.git', 'dist', 'node_modules', 'public' },
    indent = { enabled = true },
    picker = { enable  = true },
    zen = {
      enable  = true,
      toggles = {
        dim = true,
        cursorline = false,
        number = false,
        relativenumber = false,
      },
      win = {
        width = 0.5,
      },
      zoom = {
        font_size = 4,
      }
    }
  }
}
