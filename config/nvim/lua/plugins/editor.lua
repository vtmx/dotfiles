return {
  {
    'christoomey/vim-tmux-navigator',
    event = 'VeryLazy'
  },
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
         mappings = {
          -- add = 'ys',         -- Add surrounding in Normal and Visual modes - slow in visual
          delete = 'ds',         -- Delete surrounding
          find = 'sf',           -- Find surrounding (to the right)
          find_left = 'sF',      -- Find surrounding (to the left)
          highlight = 'sh',      -- Highlight surrounding
          replace = 'cs',        -- Replace surrounding
          update_n_lines = 'sn', -- Update `n_lines`
          suffix_last = 'l',     -- Suffix to search with "prev" method
          suffix_next = 'n',     -- Suffix to search with "next" method
        }
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
    'neovim/nvim-lspconfig',
    event = 'BufEnter'
  },
  {
    'phaazon/hop.nvim',
    cmd = 'HopChar1',
    config = true
  }
}
