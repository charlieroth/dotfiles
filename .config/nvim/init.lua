-- Setup plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Plugin declarations
require("lazy").setup({
  spec = {
    {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = { style = "night" },
    },
    {
      'stevearc/oil.nvim',
      opts = {},
      dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
      'nvim-treesitter/nvim-treesitter'
    },
    {
      'hrsh7th/nvim-cmp',
      dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
      }
    }
  },
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = false },
})

-- Load modules
require('options')
require('colors')
require('file-explorer')
require('scope')
require('treesitter')
require('completions')
