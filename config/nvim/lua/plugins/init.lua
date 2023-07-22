return {
  { 'christoomey/vim-tmux-navigator' },
  { 'lukas-reineke/indent-blankline.nvim', event = 'VeryLazy' },
  { 'neovim/nvim-lspconfig', event = 'VeryLazy' },
  { 'junegunn/vim-slash', event = 'VeryLazy'},
  { 'echasnovski/mini.align', event = 'VeryLazy', config = function() require('mini.align').setup() end },
  { 'echasnovski/mini.comment', config = function() require('mini.comment').setup() end },
  { 'echasnovski/mini.completion', event = 'VeryLazy', config = function() require('mini.completion').setup() end },
  { 'echasnovski/mini.jump', event = 'VeryLazy', config = function() require('mini.jump').setup() end },
}
