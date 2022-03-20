------------------------------------------------------------
-- plugins
------------------------------------------------------------

local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system ({
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path
	})
end

-- telescope
local actions = require('telescope.actions')

return require('packer').startup(
	function(use)

		------------------------------------------------------------
		-- better-scape
		------------------------------------------------------------
		use {
			'jdhao/better-escape.vim',
			event = 'InsertEnter'
		}

		------------------------------------------------------------
		-- bufferline
		------------------------------------------------------------
		use {
			'akinsho/bufferline.nvim',
			require 'theme'
		}

		------------------------------------------------------------
		-- coc
		------------------------------------------------------------
		use {
			'neoclide/coc.nvim', branch = 'release'
		}

		------------------------------------------------------------
		-- comment
		------------------------------------------------------------
		use {
			'numToStr/Comment.nvim',
			require('Comment').setup()
		}

		------------------------------------------------------------
		-- highlightedyank
		------------------------------------------------------------
		use {
			'machakann/vim-highlightedyank'
		}

		------------------------------------------------------------
		-- indent-blankline
		------------------------------------------------------------
		use {
			'lukas-reineke/indent-blankline.nvim',
			require('indent_blankline').setup {
				filetype_exclude = {'dashboard', 'help', 'terminal'},
				show_end_of_line = false,
				-- char_highlight_list = {
				-- 		'IndentBlanklineIndent1',
				-- 		'IndentBlanklineIndent2',
				-- 		'IndentBlanklineIndent3',
				-- 		'IndentBlanklineIndent4',
				-- 		'IndentBlanklineIndent5',
				-- 		'IndentBlanklineIndent6',
				-- },
			}
		}

		------------------------------------------------------------
		-- hop
		------------------------------------------------------------
		use {
			'phaazon/hop.nvim',
			require'hop'.setup()
		}

		------------------------------------------------------------
		-- lualine
		------------------------------------------------------------
		use {
			'nvim-lualine/lualine.nvim',
			require 'theme'
		}

		------------------------------------------------------------
		-- nvim-tree
		------------------------------------------------------------
		use {
			'kyazdani42/nvim-tree.lua',
			require('nvim-tree').setup({
				auto_close = true,
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

		------------------------------------------------------------
		-- plenary
		------------------------------------------------------------
		use {
			'nvim-lua/plenary.nvim',
		}

		------------------------------------------------------------
		-- telescope
		------------------------------------------------------------
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

		------------------------------------------------------------
		-- toggleterm
		------------------------------------------------------------
		use {
			'akinsho/toggleterm.nvim',
			require('toggleterm').setup({
				-- open_mapping = [[<leader>']]
			})
		}

		------------------------------------------------------------
		-- tmux
		------------------------------------------------------------
		use {
			'nathom/tmux.nvim',
		}

		------------------------------------------------------------
		-- treesitter
		------------------------------------------------------------
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

		------------------------------------------------------------
		-- web-devicons
		------------------------------------------------------------
		use {
			'kyazdani42/nvim-web-devicons',
		}

		------------------------------------------------------------
		-- onedark
		------------------------------------------------------------
		use {
			'olimorris/onedarkpro.nvim',
			require 'theme'
		}

		-- Automatically set up your configuration after cloning packer.nvim
		-- Put this at the end after all plugins
		if packer_bootstrap then
			require('packer').sync()
		end
	end
)

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
