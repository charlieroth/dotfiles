local M = {}

M.setup = function()
    local config = require('lsp.config')

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    return {
        on_attach = function(client, bufnr)
            client.server_capabilities.document_formatting = true
            client.server_capabilities.document_range_formatting = true
            config.common_attach(client, bufnr)
        end,
        settings = {
            documentFormatting = true,
            default_config = {
                init_options = { hostInfo = 'neovim' },
                cmd = { 'hoon-language-server', '-p', '8080' },
                filetypes = { 'hoon' }
            }
        }
    }
end

return M

