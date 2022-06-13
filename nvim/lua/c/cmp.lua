local cmp = require("cmp")
local luasnip = require("luasnip")

local check_backspace = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

cmp.setup({
    snippet = {
        -- required: you must have snippet engine
        expand = function(args) luasnip.lsp_expand(args.body) end
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-y>"] = cmp.config.disable,
        ["<CR>"] = cmp.mapping.confirm({select = true}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        --[[ ["<Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif check_backspace() then
                fallback()
            else
                fallback()
            end
        end ]]
    }),
    sources = {
        {name = "nvim_lsp"}, {name = "nvim_lua"}, {name = "luasnip"},
        {name = "buffer"}, {name = "path"}
    },
    window = {
        documentation = {
            border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}
        }
    }
})
