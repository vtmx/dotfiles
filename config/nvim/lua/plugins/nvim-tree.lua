return {
  'nvim-tree/nvim-tree.lua',
  opts = {
    disable_netrw = false,
    hijack_netrw = false,
    actions = { open_file = { quit_on_open = true } },
    view = { width = 30 }
  }
}
