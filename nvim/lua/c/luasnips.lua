if vim.g.snippets == "luasnip" then return end

local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt
-- local types = require("luasnip.util.types")

ls.config.set_config {
    -- luaSnip remembers the last snippet. Can jump back into it even if you move outside the selection
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true
    --[[ ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = {{ "<--", "Error" }},
      },
    },
  }, ]]
}

-- expansion key, this will expand the current item or jump to the next item within the snippet
vim.keymap.set({'i', 's'}, '<c-k>', function()
    if ls.expand_or_jumpable() then ls.expand_or_jump() end
end, {silent = true})

-- jump backwards key, this moves to the previous item within snippet
vim.keymap.set({'i', 's'}, '<c-j>',
               function() if ls.jumpable(-1) then ls.jump(-1) end end,
               {silent = true})

-- selecting within a list of options, useful for choice nodes
vim.keymap.set({'i'}, '<c-l>', function()
    if ls.choice_active() then ls.change_choice(1) end
end, {silent = true})

vim.keymap.set({'n'}, '<leader><leader>s',
               '<cmd>luafile ~/.config/nvim/lua/c/luasnips.lua<cr>',
               {silent = true})

ls.add_snippets("zig", {
    s("zt", fmt([[
            test "{}" {{
                {}
            }}
        ]], {i(1), i(2)})), s("fnm", fmt([[
            pub fn main({}) {}!void {{
                {}
            }}
        ]], {i(1), i(2), i(3)})), s("istd", t('const std = @import("std");')),
    s("iex", t("const expect = std.testing.expect;"))
})
