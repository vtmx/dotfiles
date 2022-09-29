------------------------------------------------------------
-- plugins
-- ~/.local/share/nvim/site/pack/packer/start/
------------------------------------------------------------

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#23272e" })
  print 'Cloning packer...'
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
  vim.cmd 'PackerSync'

  return true
end

require('packer').startup(function(use)
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
  } -- end-use

  -- telescope
  local actions = require('telescope.actions')
  use {
    'nvim-lua/telescope.nvim',

    require('telescope').setup({
      defaults = {
        disable_devicons=true,
        sorting_strategy = 'ascending',
        layout_config = {
          horizontal = {
            prompt_position = 'top',
          },
        },
        mappings = {
          n = {
            ['<c-c>'] = actions.close
          },
          i = {
            ['<c-j>'] = actions.move_selection_next,
            ['<c-k>'] = actions.move_selection_previous,
            ['<c-c>'] = actions.close
          }
        }
      }
    })
  } -- end-use

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
  } -- end-use
end) -- end-packer

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
