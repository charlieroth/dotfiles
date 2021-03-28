local o, wo, bo = vim.o, vim.wo, vim.bo
local utils = require('config.utils')
local opt = utils.opt
local autocmd = utils.autocmd
local map = utils.map
local buffer = {o, bo}
local window = {o, wo}
-- Core
opt('mouse', 'nivh')
opt('wildignore', 'node_modules/**/*')
opt('wildmode', 'longest,full')
opt('shortmess', o.shortmess .. 'c')
opt('completeopt', 'menuone,noinsert,noselect')
opt('guicursor', [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]])
opt('lazyredraw', true)
opt('showmatch', true)
opt('ignorecase', true)
opt('smartcase', true)
opt('hidden', true)
opt('splitright', true)
opt('splitbelow', true)
opt('showmode', false)
opt('joinspaces', false)
opt('updatetime', 1000)
opt('laststatus', 2)
opt('scrolloff', 10)
opt('previewheight', 5)
-- Buffer
opt('expandtab', true, buffer)
opt('autoindent', true, buffer)
opt('undofile', true, buffer)
opt('tabstop', 4, buffer)
opt('shiftwidth', 4, buffer)
opt('softtabstop', 4, buffer)
-- Window
opt('concealcursor', 'nc', window)
opt('signcolumn', 'yes:1', window)
opt('number', true, window)
opt('relativenumber', true, window)
opt('conceallevel', 2, window)
opt('breakindent', true, window)
-- Colors
opt('background', 'dark')
opt('termguicolors', true)
-- Modules
require('char.keymappings') -- Key Mappings
require('plugins') -- Plugins
require('lsp') -- LSP
require('lsp.js-ts-ls') -- LSP
require('kommentary') -- Comments
require('colorbuddy').colorscheme('gruvbuddy') -- Gruvbox
require('char.telescope') -- Telescope
