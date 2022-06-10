local prettier = require('lsp.efm.prettier')
local luafmt = require('lsp.efm.lua-format')

local M = {}

M.setup = function()
    local config = require('lsp.config')

    local languages = {
        lua = {luafmt},
        typescript = {prettier},
        javascript = {prettier},
        typescriptreact = {prettier},
        javascriptreact = {prettier},
        yaml = {prettier},
        json = {prettier},
        html = {prettier},
        markdown = {prettier}
    }
    return {
        on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = true
            client.resolved_capabilities.document_range_formatting = true
            config.common_attach(client, bufnr)
        end,
        init_options = {documentFormatting = true, codeAction = true},
        filetypes = vim.tbl_keys(languages),
        settings = {
            languages = languages,
            log_level = 1,
            log_file = '~/efm.log'
        }
    }
end

return M
