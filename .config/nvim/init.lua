-- global vars
local cmd = vim.cmd
local fn = vim.fn
local command = vim.api.nvim_command

-- auto install packer.nvim if not exists
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  command('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
cmd [[packadd packer.nvim]]

-- Auto compile when there are changes in plugins.lua
cmd 'autocmd BufWritePost plugins.lua PackerCompile'

require('settings')
require('plugins')
require('mappings')
require('theme')
