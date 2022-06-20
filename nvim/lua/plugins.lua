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

    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'nvim-telescope/telescope.nvim'

    use 'b3nj5m1n/kommentary'

    use 'ellisonleao/gruvbox.nvim'
    if PackerBootstrap then require('packer').sync() end
end)
