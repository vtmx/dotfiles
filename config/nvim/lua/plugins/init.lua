return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = 'ibl',
    event = 'BufEnter',
    config = true
  },
  {
    'phaazon/hop.nvim',
    cmd = 'HopChar1',
    config = true
  },
  {
    'echasnovski/mini.align',
    event = 'BufEnter',
    config = true
  },
  {
    'echasnovski/mini.comment',
    event = 'BufEnter',
    config = true
  },
  {
    'echasnovski/mini.jump',
    event = 'BufEnter',
    config = true
  },
  {
    'neovim/nvim-lspconfig',
    event = 'BufEnter'
  },
  {
    'kyazdani42/nvim-web-devicons',
    event = 'VeryLazy'
  },
  {
    'junegunn/vim-slash',
    event = 'BufEnter'
  },
  { 
    'christoomey/vim-tmux-navigator',
    event = 'BufEnter'
  }
}
