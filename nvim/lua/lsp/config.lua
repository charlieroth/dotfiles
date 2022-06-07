local M = {}

M.common_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    local opts = {noremap = true, silent = true}
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

    -- Mappings.
    local bopts = {noremap = true, silent = true, buffer = bufnr}

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bopts)
    vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, bopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bopts)
    vim.keymap.set('n', '<leader>td', vim.lsp.buf.type_definition, bopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bopts)
    vim.keymap.set('n', '<leader>ld', vim.lsp.diagnostic.show_line_diagnostics,
                   bopts)
    vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bopts)
end

return M
