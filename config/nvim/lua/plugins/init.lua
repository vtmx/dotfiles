return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'VeryLazy',
    opts = { scope = { enabled = false } }
  },
  {
    'phaazon/hop.nvim',
    cmd = 'HopChar1',
    config = true
  },
  {
    'echasnovski/mini.ai',
    event = 'VeryLazy',
    config = true
  },
  {
    'echasnovski/mini.align',
    event = 'VeryLazy',
    config = true
  },
  {
    'echasnovski/mini.files',
    cmd = 'MiniFiles',
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
    event = 'InsertEnter'
  }
}
