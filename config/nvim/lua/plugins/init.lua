return {
  -- { 'christoomey/vim-tmux-navigator' },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead'
  },
  {
    'kyazdani42/nvim-web-devicons',
    event = 'VeryLazy'
  },
  {
    'neovim/nvim-lspconfig',
    event = 'BufRead'
  },
  {
    'junegunn/vim-slash',
    event = 'BufRead'
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
  }
}
