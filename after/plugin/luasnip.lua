local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

require("luasnip.loaders.from_vscode").lazy_load()

ls.config.set_config{
    history = true,

    updateevents = "TextChanged,TextChangedI",

    enable_autosnippets = true;
}

vim.keymap.set({"i", "s"}, "<c-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true }
)


vim.keymap.set({"i", "s"}, "<c-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true }
)


vim.keymap.set("i", "<c-l>", function()
    if ls.choice_acvitve() then
        ls.change_choice(1)
    end
end
)


-- Snippets
--[[
ls.add_snippets("all",{
    s("once", {
        t("#include <iostream>")
    })
})
--]]

