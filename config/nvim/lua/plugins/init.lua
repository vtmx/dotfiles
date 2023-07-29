return {
  { 'christoomey/vim-tmux-navigator' },
  { 'lukas-reineke/indent-blankline.nvim' },
  { 'neovim/nvim-lspconfig' },
  { 'junegunn/vim-slash' },
  { 'echasnovski/mini.comment', config = function() require('mini.comment').setup() end },
  { 'echasnovski/mini.jump', config = function() require('mini.jump').setup() end },
}
