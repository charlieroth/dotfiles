local M = {}

M.setup = function()
    local util = require('lspconfig.util')
    local config = require('lsp.config')

    local bin_name = 'typescript-language-server'
    local cmd = { bin_name, '--stdio' }

    return {
        on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = true
            client.resolved_capabilities.document_range_formatting = true
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
