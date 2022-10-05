------------------------------------------------------------
-- plugins
-- ~/.local/share/nvim/site/pack/packer/start
-- https://www.chiarulli.me/Neovim-2/03-plugins
------------------------------------------------------------

-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#1e2227' })
  print('Cloning packer...')
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd "packadd packer.nvim"
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end
  }
})

-- Install your plugins here
return packer.startup(function(use)
  -- packer
  use 'wbthomason/packer.nvim'

  -- requirements
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'

  -- ui
  use 'navarasu/onedark.nvim'
  use 'olimorris/onedarkpro.nvim' 
  use 'kyazdani42/nvim-tree.lua'
  use 'nvim-lualine/lualine.nvim'
  use 'akinsho/bufferline.nvim'

  -- utils
  use 'nathom/tmux.nvim'
  use 'tpope/vim-surround'
  use 'numToStr/Comment.nvim'
  use 'windwp/nvim-autopairs'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'phaazon/hop.nvim'
  use 'nvim-lua/telescope.nvim'

  -- syntaxes
  use 'baskerville/vim-sxhkdrc'
  use 'fladson/vim-kitty'
  use 'khaveesh/vim-fish-syntax'

  -- autocomplete
  use 'nvim-treesitter/nvim-treesitter'
  use { 'neoclide/coc.nvim', branch = 'release' }

  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  else
    require('plugins.config')
  end
end)
