local opts = { noremap = true, silent = true }
-- leader
vim.keymap.set({ 'n' }, ',', '<NOP>', opts)
vim.g.mapleader = ','
-- escape
vim.keymap.set({ 'i' }, 'jk', '<ESC>', opts)
-- tabs
vim.keymap.set({ 'n' }, 'tn', ':tabnew<Space>', opts)
vim.keymap.set({ 'n' }, 'tn', ':tabnew<Space>', opts)
vim.keymap.set({ 'n' }, 'tm', ':tabmove<Space>', opts)
vim.keymap.set({ 'n' }, 'tk', ':tabnext<cr>', opts)
vim.keymap.set({ 'n' }, 'tj', ':tabprev<cr>', opts)
vim.keymap.set({ 'n' }, 'th', ':tabfirst<cr>', opts)
vim.keymap.set({ 'n' }, 'tl', ':tablast<cr>', opts)
-- window movement
vim.keymap.set({ 'n' }, '<C-j>', '<C-W>j', opts)
vim.keymap.set({ 'n' }, '<C-k>', '<C-W>k', opts)
vim.keymap.set({ 'n' }, '<C-h>', '<C-W>h', opts)
vim.keymap.set({ 'n' }, '<C-l>', '<C-W>l', opts)
-- telescope
vim.keymap.set({ 'n' }, '<Leader>ff', ":Telescope find_files<cr>", opts)
vim.keymap.set({ 'n' }, '<Leader>gf', ":Telescope git_files<cr>", opts)
vim.keymap.set({ 'n' }, '<Leader>gs', ":lua require('telescope.builtin').git_status()<cr>", opts)
vim.keymap.set({ 'n' }, '<Leader>fg', ':Telescope live_grep<cr>', opts)
vim.keymap.set({ 'n' }, '<Leader>fb', ':Telescope file_browser<cr>', opts)
vim.keymap.set({ 'n' }, '<Leader>fh', ':Telescope help_tags<cr>', opts)
vim.keymap.set({ 'n' }, '<Leader>fp', ':!yarn prettier<cr>', opts)
-- cargo
vim.keymap.set({ 'n' }, '<Leader>ct', ':!cargo test<cr>', opts)
vim.keymap.set({ 'n' }, '<Leader>cc', ':!cargo check<cr>', opts)
-- zig
vim.keymap.set({ 'n' }, '<Leader>zt', ':!zig test %<cr>', opts)
vim.keymap.set({ 'n' }, '<Leader>zr', ':!zig run %<cr>', opts)
-- go
-- TODO(charlieroth): add maps for gofmt
-- Other
vim.keymap.set({ 'n' }, '<Leader>h', ':set hlsearch!<cr>', opts)
