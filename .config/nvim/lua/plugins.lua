vim.cmd('packadd packer.nvim')

return require('packer').startup (
	function()
		use 'kyazdani42/nvim-tree.lua'
		use 'nvim-lualine/lualine.nvim'
		use 'olimorris/onedarkpro.nvim'
		use 'nvim-lua/plenary.nvim'
		use 'nvim-lua/telescope.nvim'
		use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	end
)
