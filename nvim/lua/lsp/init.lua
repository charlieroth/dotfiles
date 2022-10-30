local lspconfig = require('lspconfig')

local servers = {
    { name = 'sumneko_lua', location = 'lsp.sumneko_lua', enabled = true },
    { name = 'zls', location = 'lsp.zls', enabled = true },
    -- TODO(charlieroth): Install
    { name = 'rust_analyzer', location = 'lsp.rust_analyzer', enabled = false },
    { name = 'hoon_ls', location = 'lsp.hoon', enabled = false },
    { name = 'clojure_lsp', location = 'lsp.clojure', enabled = false },
}

for _, server in ipairs(servers) do
    if server.enabled then
        lspconfig[server.name].setup(require(server.location).setup())
    end
end
