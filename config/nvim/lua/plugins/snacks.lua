return {
  'folke/snacks.nvim',
  priority = 1000,
  opts = {
    exclude = { '.git', 'dist', 'node_modules', 'public' },
    indent = { enabled = true },
    picker = { enable  = true },
    zen    = { enable  = true },
  }
}
