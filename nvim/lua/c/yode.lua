require('yode-nvim').setup({})
local map = require('c.utils').map
local opts = { noremap = true, silent = true }

map('v', '<Leader>yc', ':YodeCreateSeditorFloating<cr>', opts)
map('n', 'yr', ':YodeCreateSeditorReplace<cr>', opts)
-- map('n', 'bd', ':YodeBufferDelete<cr>', opts)
-- map('i', 'bd', '<esc>:YodeBufferDelete<cr>', opts)
map('n', '<C-W>r', ':YodeLayoutShiftWinDown<cr>', opts)
map('n', '<C-W>R', ':YodeLayoutShiftWinUp<cr>', opts)
map('n', '<C-W>J', ':YodeLayoutShiftWinBottom<wr>', opts)
map('n', '<C-W>K', ':YodeLayoutShiftWinTop<cr>', opts)
