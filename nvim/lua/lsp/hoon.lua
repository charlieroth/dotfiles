local M = {}

M.setup = function()
    local config = require('lsp.config')

    return {
        on_attach = config.common_attach,
        cmd = {
            "hoon-language-server", "-p", "80", "-d", "0", "-u",
            "http://localhost", "-s", "zod", "-c", "lidlut-tabwed-pillex-ridrup"
        }
    }
end

return M

