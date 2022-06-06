local M = {}

function M.buf_set_keymaps(bufnr)
    local opts = {noremap = true, silent = true}

    local function map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function opt(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    opt("omnifunc", "v:lua.vim.lsp.omnifunc")

    map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
    map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
    map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
    map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)

    map("n", "K", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
    map("n", "<leader>gh", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

    map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", opts)
    map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", opts)
    map("n", "<leader>sd",
        "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>", opts)
    map("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", opts)

    map("n", "<leader>bf", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
    map("v", "<leader>rf", "<cmd>lua vim.lsp.buf.range_formatting()<cr>", opts)
    map("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
    map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    map("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>",
        opts)
    map("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>",
        opts)

    map("n", "<leader>l",
        "<cmd>lua require'lsp-codelens'.buf_codelens_action()<cr>", opts)
    map("n", "<leader>wl",
        "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
        opts)
end

return M
