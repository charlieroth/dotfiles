return {
    {
        "vimpostor/vim-lumen",
        lazy = false,
        priority = 10010,
        init = function()
            vim.cmd([[
                au User LumenLight echom 'catppuccin-latte'
                au User LumenDark echom 'catppuccin-mocha'
            ]])
        end
    },
    { 
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 10000,
        lazy = false,
        config = function()
            require('catppuccin').setup({
                background = {
                    light = "latte",
                    dark = "mocha",
                }
            })
            vim.cmd.colorscheme('catppuccin')
        end
    },
}

