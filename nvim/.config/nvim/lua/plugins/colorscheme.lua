return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin"
    end,
    opts = {
      flavour = "auto", -- latte, frappe, macchiato, mocha
      background = { -- :h background
          light = "latte",
          dark = "mocha",
      },
    }
  }
}


