local M = {}

M.setup = function()
    local config = require('lsp.config')
    local runtime_path = vim.split(package.path, ';')

    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")

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
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                    path = runtime_path
                },
                diagnostics = {
                    globals = { 'vim' }
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true)
                },
                telemetry = { enable = false }
            }
        }
    }
end

return M
