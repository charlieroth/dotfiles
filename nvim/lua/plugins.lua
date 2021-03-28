-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Colorscheme
  use 'tjdevries/colorbuddy.nvim'
  use 'tjdevries/gruvbuddy.nvim'
  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  -- FZF
  use {'junegunn/fzf', run = './install --all' } -- Fuzzy Searcher
  use {'junegunn/fzf.vim'}
  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use 'nvim-telescope/telescope-fzf-writer.nvim'
  use 'nvim-telescope/telescope-packer.nvim'
  use 'nvim-telescope/telescope-github.nvim'
  -- Formatting
  use 'sbdchd/neoformat'
  -- Languages
  use 'ziglang/zig.vim'
  -- Kommentary
  use 'b3nj5m1n/kommentary'
end)
