return {
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead'
  },
  -- example: ga=
  {
    'echasnovski/mini.align',
    event = 'BufRead',
    config = function()
      require('mini.align').setup()
    end
  },
  {
    'echasnovski/mini.comment',
    event = 'BufRead',
    config = function()
      require('mini.comment').setup()
    end
  },
  {
    'echasnovski/mini.jump',
    event = 'VeryLazy',
    config = function()
      require('mini.jump').setup()
    end
  },
  {
    'neovim/nvim-lspconfig',
    event = 'BufReadPre'
  },
  {
    'kyazdani42/nvim-web-devicons',
    event = 'VeryLazy'
  },
  {
    'junegunn/vim-slash',
    event = 'BufRead'
  },
  { 
    'christoomey/vim-tmux-navigator',
    event = 'BufRead'
  }
}
