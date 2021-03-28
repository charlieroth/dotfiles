local g = vim.g
local utils = require('config.utils')
local opt = utils.opt
local autocmd = utils.autocmd
local map = utils.map

-- Leader
map('n', ',', '<NOP>', { noremap = true, silent = true })
g.mapleader = ','
-- Explore
map('n', '<Leader>e', ':Lexplore<CR>', { noremap = true, silent = true })
-- Tabs
map('n', 'tn', ':tabnew<Space>', { noremap = true, silent = false })
map('n', 'tm', ':tabmove<Space>', { noremap = true, silent = false })
map('n', 'tk', ':tabnext<CR>', { noremap = true, silent = false })
map('n', 'tj', ':tabprev<CR>', { noremap = true, silent = false })
map('n', 'th', ':tabfirst<CR>', { noremap = true, silent = false })
map('n', 'tl', ':tablast<CR>', { noremap = true, silent = false })
-- Escape
map('i', 'jk', '<ESC>', { noremap = true, silent = true })
map('i', 'kj', '<ESC>', { noremap = true, silent = true })
-- Easy window movement
map('n', '<C-j>', '<C-W>j', { silent = true })
map('n', '<C-k>', '<C-W>k', { silent = true })
map('n', '<C-h>', '<C-W>h', { silent = true })
map('n', '<C-l>', '<C-W>l', { silent = true })
-- other
map('n', '<Leader>h', ':set hlsearch!<CR>', { noremap = true, silent = true })
-- Telescope
map('n', '<Leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true })
map('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>', { noremap = true, silent = true })
map('n', '<Leader>fb', '<cmd>Telescope buffers<CR>', { noremap = true, silent = true })
map('n', '<Leader>fh', '<cmd>Telescope help_tags<CR>', { noremap = true, silent = true })
map('n', '<Leader>vdf', ':lua require("char.telescope").search_dotfiles()<CR>', { noremap = true, silent = true })
map('n', '<Leader>gb', ':lua require("char.telescope").git_branches()<CR>', { noremap = true, silent = true })
