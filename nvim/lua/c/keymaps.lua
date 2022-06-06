-- Leader
vim.keymap.set({ 'n' }, ',', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ','
-- Tabs
vim.keymap.set({ 'n' }, 'tn', ':tabnew<Space>', { noremap = true, silent = true })
vim.keymap.set({ 'n' }, 'tn', ':tabnew<Space>', { noremap = true, silent = true })
vim.keymap.set({ 'n' }, 'tm', ':tabmove<Space>', { noremap = true, silent = true })
vim.keymap.set({ 'n' }, 'tk', ':tabnext<cr>', { noremap = true, silent = true })
vim.keymap.set({ 'n' }, 'tj', ':tabprev<cr>', { noremap = true, silent = true })
vim.keymap.set({ 'n' }, 'th', ':tabfirst<cr>', { noremap = true, silent = true })
vim.keymap.set({ 'n' }, 'tl', ':tablast<cr>', { noremap = true, silent = true })
-- Escape
vim.keymap.set({ 'i' }, 'jk', '<ESC>', { noremap = true, silent = true })
-- Window movement
vim.keymap.set({ 'n' }, '<C-j>', '<C-W>j', { silent = true })
vim.keymap.set({ 'n' }, '<C-k>', '<C-W>k', { silent = true })
vim.keymap.set({ 'n' }, '<C-h>', '<C-W>h', { silent = true })
vim.keymap.set({ 'n' }, '<C-l>', '<C-W>l', { silent = true })
-- Telescope
vim.keymap.set({ 'n' }, '<Leader>ff', ":Telescope git_files<cr>", { noremap = true, silent = true })
vim.keymap.set({ 'n' }, '<Leader>gs', ":lua require('telescope.builtin').git_status()<cr>", { noremap = true, silent = true })
vim.keymap.set({ 'n' }, '<Leader>tf', ":Telescope find_files<cr>", { noremap = true, silent = true })
vim.keymap.set({ 'n' }, '<Leader>fg', ':Telescope live_grep<cr>', { noremap = true, silent = true })
vim.keymap.set({ 'n' }, '<Leader>fb', ':Telescope file_browser<cr>', { noremap = true, silent = true })
vim.keymap.set({ 'n' }, '<Leader>fp', ':!yarn prettier<cr>', { noremap = true, silent = true })
-- Cargo
vim.keymap.set({ 'n' }, '<Leader>ct', ':!cargo test<cr>', { noremap = true, silent = true })
vim.keymap.set({ 'n' }, '<Leader>cc', ':!cargo check<cr>', { noremap = true, silent = true })
-- Zig
vim.keymap.set({ 'n' }, '<Leader>zt', ':!zig test %<cr>', { noremap = true, silent = true })
vim.keymap.set({ 'n' }, '<Leader>zr', ':!zig run %<cr>', { noremap = true, silent = true })
-- Other
vim.keymap.set({ 'n' }, '<Leader>h', ':set hlsearch!<cr>', { noremap = true, silent = true })
