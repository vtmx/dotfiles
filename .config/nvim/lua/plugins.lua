return require('packer').startup (
	function()
		use {
			'kyazdani42/nvim-tree.lua',
			requires = 'kyazdani42/nvim-web-devicons',
			config = function() require'nvim-tree'.setup() end
		}

		use 'nvim-lualine/lualine.nvim'

		use {
			'numToStr/Comment.nvim',
			config = function() require('Comment').setup() end
		}

		use 'nathom/tmux.nvim'
		use {'neoclide/coc.nvim', branch = 'release'}
		use 'nvim-lua/plenary.nvim'
		use 'nvim-lua/telescope.nvim'
		use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
		use 'olimorris/onedarkpro.nvim'
		use 'sunjon/shade.nvim'
		use 'joshdick/onedark.vim'
	end
)

-- coc
--:CocInstall coc-eslint
--:CocInstall coc-emmet
--:CocInstall coc-pairs
--:CocInstall coc-snippets
--:CocInstall coc-prettier
--:CocInstall coc-vetur
