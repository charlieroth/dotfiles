local lspconfig = require('lspconfig')

local servers = {
    { name = 'sumneko_lua', location = 'lsp.sumneko_lua', enabled = true },
    { name = 'tsserver', location = 'lsp.tsserver', enabled = false },
    { name = 'gopls', location = 'lsp.gopls', enabled = false },
    { name = 'zls', location = 'lsp.zls', enabled = false },
    { name = 'efm', location = 'lsp.efm', enabled = false },
}

for _, server in ipairs(servers) do
    if server.enabled then
        lspconfig[server.name].setup(require(server.location).setup())
    end
end
