-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.ignorecase = true
opt.number = false
opt.relativenumber = false
opt.scrolloff = 8

vim.g.mkdp_browser = "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
vim.g.lazygit_config = false
vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff_lsp"
