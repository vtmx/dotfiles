return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = 'ibl',
    event = 'BufReadPre',
    config = true
  },
  {
    'phaazon/hop.nvim',
    cmd = 'HopChar1',
    config = true
  },
  {
    'echasnovski/mini.align',
    event = 'BufReadPre',
    config = true
  },
  {
    'echasnovski/mini.comment',
    event = 'BufReadPre',
    config = true
  },
  {
    'echasnovski/mini.jump',
    event = 'VeryLazy',
    config = true
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
    event = 'BufReadPre'
  },
  { 
    'christoomey/vim-tmux-navigator',
    event = 'BufReadPre'
  }
}
