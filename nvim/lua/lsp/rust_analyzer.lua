local M = {}

M.setup = function()
    local config = require('lsp.config')

    return {
        on_attach = config.common_attach,
        settings = {
            ["rust-analyzer"] = {
                assist = {
                    importGranularity = "module",
                    importPrefix = "by_self"
                },
                cargo = {loadOutDirsFromCheck = true},
                procMacro = {enable = true}
            }
        }
    }
end

return M
