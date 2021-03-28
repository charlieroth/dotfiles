local utils = require('config.utils')
local map = utils.map

map('n', 'K', ':lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
map('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })
map('n', 'gr', ':lua vim.lsp.buf.references()', { noremap = true, silent = true })
-- map('n', '<Leader>sh', ':lua vim.lsp.buf.signature_help()', { noremap = true, silent = true })
-- map('n', '<Leader>vrn', ':lua vim.lsp.buf.rename()', { noremap = true, silent = true })
-- map('n', 'ca', ':lua vim.lsp.buf.code_action()', { noremap = true, silent = true })
--[[ map(
  'n',
  '<Leader>vsd',
  ':lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>',
  {
    noremap = true,
    silent = true
  }
) ]]
map('n', '[g', ':lua vim.lsp.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
map('n', ']g', ':lua vim.lsp.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
