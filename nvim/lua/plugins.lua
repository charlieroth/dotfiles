local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PackerBootstrap = fn.system({
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim', install_path
    })
end

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Treesitter
    use 'nvim-treesitter/nvim-treesitter'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'RishabhRD/popfix'
    use 'RishabhRD/nvim-lsputils'

    -- Completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-file-browser.nvim'}
        }
    }

    -- Statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- Comments
    use 'b3nj5m1n/kommentary'

    -- Colors
    use 'tjdevries/colorbuddy.nvim'
    use 'EdenEast/nightfox.nvim'
    use 'ellisonleao/gruvbox.nvim'
    use({"catppuccin/nvim", as = "catppuccin"})

    -- Git
    use 'lewis6991/gitsigns.nvim'

    -- Language Plugins
    use 'ray-x/go.nvim'
    use 'ziglang/zig.vim'
    use 'urbit/hoon.vim'

    if PackerBootstrap then require('packer').sync() end
end)
