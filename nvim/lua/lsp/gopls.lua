local M = {}

M.setup = function()
    local util = require('lspconfig.util')
    local config = require('lsp.config')

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    return {
        on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = true
            config.common_attach(client, bufnr)
        end,
        cmd = {"gopls"},
        filetypes = {"go", "gomod"},
        root_dir = util.root_pattern("go.mod", ".git"),
        -- for postfix snippets and analyzers
        capabilities = capabilities,
        settings = {
            gopls = {
                experimentalPostfixCompletions = true,
                analyses = {unusedparams = true, shadow = true},
                staticcheck = true
            }
        }
    }
end

return M
