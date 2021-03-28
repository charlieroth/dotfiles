local on_attach = require('completion').on_attach

require('lspconfig').tsserver.setup{ 
  filetypes = { 
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.jsx"
  },
  on_attach = on_attach,
}
