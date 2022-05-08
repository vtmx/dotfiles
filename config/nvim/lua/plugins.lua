------------------------------------------------------------
-- plugins
-- ~/.local/share/nvim/site/pack/packer/start/
------------------------------------------------------------

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- telescope
local actions = require('telescope.actions')

return require('packer').startup(function(use)
		-- packer
		use 'wbthomason/packer.nvim'

		-- requirements
		use 'nvim-lua/plenary.nvim'
		use 'kyazdani42/nvim-web-devicons'

		-- plugins
		use 'machakann/vim-highlightedyank'
		use 'nathom/tmux.nvim'
		use 'tpope/vim-surround'

		-- syntaxes
		use 'baskerville/vim-sxhkdrc'
		use 'fladson/vim-kitty'
		use 'khaveesh/vim-fish-syntax'

		-- ui
		use 'olimorris/onedarkpro.nvim' 
		use 'nvim-lualine/lualine.nvim'
		use 'akinsho/bufferline.nvim'

		-- coc
		use { 'neoclide/coc.nvim', branch = 'release' }

		-- better-scape
		use {
			'jdhao/better-escape.vim',
			event = 'InsertEnter'
		}

		-- comment
		use {
			'numToStr/Comment.nvim',
			require('Comment').setup()
		}

		-- indent-blankline
		use {
			'lukas-reineke/indent-blankline.nvim',
			require('indent_blankline').setup { filetype_exclude = {'dashboard', 'help', 'terminal'} }
		}

		-- hop
		use {
			'phaazon/hop.nvim',
			require'hop'.setup()
		}

		-- nvim-tree
		use {
			'kyazdani42/nvim-tree.lua',

			require('nvim-tree').setup({
				disable_netrw = false,
				hijack_netrw = false,
				actions = {
					open_file = {
						quit_on_open = true,
					}
				},
				view = {
					width = 30,
					hide_root_folder = true,
				}
			})
		}

		-- telescope
		use {
			'nvim-lua/telescope.nvim',

			require('telescope').setup({
				defaults = {
					disable_devicons=true,
					mappings = {
						i = {
							['<c-j>'] = actions.move_selection_next,
							['<c-k>'] = actions.move_selection_previous
						}
					}
				}
			})
		}

		-- treesitter
		use {
			'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',

			require'nvim-treesitter.configs'.setup {
				highlight = {
					enable = true
				},
				indent = {
					enable = true
				}
			}
		}

		-- Automatically cloning packer.nvim
		if packer_bootstrap then
			require('packer').sync()
		end
end)

-- instructions

-- coc
--:CocInstall coc-eslint
--:CocInstall coc-emmet
--:CocInstall coc-pairs
--:CocInstall coc-snippets
--:CocInstall coc-prettier
--:CocInstall coc-vetur

-- treesitter
-- :TSInstall vue javascript typescript html css scss
