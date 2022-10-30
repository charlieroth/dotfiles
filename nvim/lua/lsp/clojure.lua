local M = {}

M.setup = function()
    local config = require('lsp.config')

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    return { on_attach = config.common_attach }
end

return M
