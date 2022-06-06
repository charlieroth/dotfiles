local M = {}

M.setup = function()
    local config = require('lsp.config')

    return {on_attach = config.common_attach, init_options = {lint = true}}
end

return M
