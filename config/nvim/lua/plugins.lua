------------------------------------------------------------
-- plugins
------------------------------------------------------------

require('plugins.better-scape')
require('plugins.bufferline')
require('plugins.comment')
require('plugins.highlightedyank')
require('plugins.hop')
require('plugins.indent-blankline')
require('plugins.lualine')
require('plugins.nvim-tree')
require('plugins.telescope')
require('plugins.toggleterm')
require('plugins.treesitter')
require('plugins.shade')

return require('packer').startup(
	function()
		use 'akinsho/bufferline.nvim'
		use 'akinsho/toggleterm.nvim'
		use {'jdhao/better-escape.vim', event = 'InsertEnter'}
		use 'joshdick/onedark.vim'
		use 'kyazdani42/nvim-tree.lua'
		use 'kyazdani42/nvim-web-devicons'
		use 'lukas-reineke/indent-blankline.nvim'
		use 'machakann/vim-highlightedyank'
		use 'nvim-lualine/lualine.nvim'
		use 'nathom/tmux.nvim'
		use 'nvim-lua/plenary.nvim'
		use 'nvim-lua/telescope.nvim'
		use 'numToStr/Comment.nvim'
		use 'olimorris/onedarkpro.nvim'
		use 'phaazon/hop.nvim'
		use 'sunjon/shade.nvim'
		use {'neoclide/coc.nvim', branch = 'release'}
		use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	end
)

-- coc
--:CocInstall coc-eslint
--:CocInstall coc-emmet
--:CocInstall coc-pairs
--:CocInstall coc-snippets
--:CocInstall coc-prettier
--:CocInstall coc-vetur

-- treesitter	
-- :TSInstall vue javascript typescript html css scss
