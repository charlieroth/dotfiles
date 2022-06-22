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

    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'

    use 'neovim/nvim-lspconfig'
    use 'RishabhRD/popfix'
    use 'RishabhRD/nvim-lsputils'

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'nvim-telescope/telescope.nvim'

    use 'b3nj5m1n/kommentary'

    use 'ellisonleao/gruvbox.nvim'
    if PackerBootstrap then require('packer').sync() end
end)
