local M = {}

M.setup = function()
    local util = require('lspconfig.util')
    local config = require('lsp.config')

    local bin_name = 'typescript-language-server'
    local cmd = { bin_name, '--stdio' }

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
                cmd = cmd,
                filetypes = {
                    'javascript', 'javascriptreact', 'javascript.jsx',
                    'typescript', 'typescriptreact', 'typescript.tsx'
                },
                root_dir = function(fname)
                    return util.root_pattern 'tsconfig.json' (fname) or
                        util.root_pattern('package.json',
                            'jsconfig.json', '.git')(fname)
                end
            }
        }
    }
end

return M
