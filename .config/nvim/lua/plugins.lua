------------------------------------------------------------
-- plugins
------------------------------------------------------------

require('plugins.bufferline')
require('plugins.indent-blankline')
require('plugins.lualine')
require('plugins.nvim-tree')
require('plugins.telescope')
require('plugins.shade')

return require('packer').startup(
	function()
		use {
			'akinsho/bufferline.nvim',
			requires = 'kyazdani42/nvim-web-devicons'
		}

		use 'joshdick/onedark.vim'

		use {
			'kyazdani42/nvim-tree.lua',
			requires = 'kyazdani42/nvim-web-devicons'
		}

		use 'nvim-lualine/lualine.nvim'

		use {
			'numToStr/Comment.nvim',
			config = function() require('Comment').setup() end
		}

		use 'lukas-reineke/indent-blankline.nvim'
		use 'nathom/tmux.nvim'
		use {'neoclide/coc.nvim', branch = 'release'}
		use 'nvim-lua/plenary.nvim'
		use 'nvim-lua/telescope.nvim'
		use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
		use 'olimorris/onedarkpro.nvim'
		use 'sunjon/shade.nvim'
	end
)

-- coc
--:CocInstall coc-eslint
--:CocInstall coc-emmet
--:CocInstall coc-pairs
--:CocInstall coc-snippets
--:CocInstall coc-prettier
--:CocInstall coc-vetur

