local M = {}

M.setup = function()
    local config = require('lsp.config')

    return {
        on_attach = config.common_attach,
        init_options = { documentFormatting = true },
        settings = {
            rootMarkers = { ".git/" },
            languages = {
                lua = { { formatCommand = "lua-format -i", formatStdin = true } }
            }
        }
    }
end

return M
