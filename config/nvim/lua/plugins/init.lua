return {
  -- { 'christoomey/vim-tmux-navigator' },
  { 'lukas-reineke/indent-blankline.nvim', event = 'VeryLazy' },
  { 'kyazdani42/nvim-web-devicons', event = 'VeryLazy' },
  { 'neovim/nvim-lspconfig', event = 'VeryLazy' },
  { 'junegunn/vim-slash', event = 'VeryLazy' },
  { 'echasnovski/mini.comment', event = 'VeryLazy', config = function() require('mini.comment').setup() end },
  { 'echasnovski/mini.jump', event = 'VeryLazy',  config = function() require('mini.jump').setup() end },
}
