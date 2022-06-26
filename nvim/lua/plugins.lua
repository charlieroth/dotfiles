local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PackerBootstrap = fn.system({
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim', install_path
    })
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'ellisonleao/gruvbox.nvim'

    use 'b3nj5m1n/kommentary'

    use 'nvim-lua/popup.nvim'

    use 'nvim-lua/plenary.nvim'

    use 'kyazdani42/nvim-web-devicons'

    use 'nvim-lualine/lualine.nvim'

    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'nvim-telescope/telescope.nvim'

    use 'neovim/nvim-lspconfig'
    use 'RishabhRD/nvim-lsputils'
    use 'RishabhRD/popfix'

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    use { 'mfussenegger/nvim-dap' }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use { 'theHamsta/nvim-dap-virtual-text' }
    use { 'rcarriga/nvim-dap-ui' }
    use { 'leoluz/nvim-dap-go' }
    use { 'Pocco81/dap-buddy.nvim', commit = '24923c3819a450a772bb8f675926d530e829665f' }

    if PackerBootstrap then require('packer').sync() end
end)
