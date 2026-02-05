return {
  {
    'nvim-mini/mini.align',
    event = 'VeryLazy',
    config = true
  },
  {
    'nvim-mini/mini.cursorword',
    config = true
  },
  {
    'nvim-mini/mini.files',
    event = 'VeryLazy',
    config = function()
      require('mini.files').setup({
        mappings = { go_in_plus = '<cr>' },
        options = { use_as_default_explorer = true }
      })
    end
  },
  {
    'nvim-mini/mini.pairs',
    event = 'VeryLazy',
    config = true
  },
  {
    'nvim-mini/mini.surround',
    event = 'VeryLazy',
    config = function()
      require('mini.surround').setup({
        search_method = 'cover_or_nearest',
        mappings = {
          add = 'gsa',
          delete = 'ds',
          replace = 'cs',
          find = '',
          find_left = '',
          highlight = '',
          suffix_last = '',
          suffix_next = ''
        }
      })
    end
  },
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
        kitty = { enabled = true, font = "+4" }
      }
    }
  }
}
