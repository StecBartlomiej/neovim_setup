local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
	'lua_ls',
	'rust_analyzer',
	'clangd',
	'pyright',
	'cmake'
})

local cmp = require('cmp')
local cmp_action = require("lsp-zero").cmp_action()


local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<Tab>'] = cmp.mapping.confirm({select = true}),
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	["<C-Space>"] = cmp.mapping.complete(),
 })

lsp.set_preferences({
	sign_icons = { }
})


lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup_nvim_cmp({
      snippet = {
            expand = function(args)
              require('luasnip').lsp_expand(args.body)
            end,
          },
    source = {
        {name = 'nvim_lsp'},
        {name = 'buffer'},
        {name = 'luasnip'},
    },
    mapping = cmp_mappings,
})



require('lspconfig').clangd.setup({
    cmd = {
        "clangd",
        "--background-index",
        -- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
        -- to add more checks, create .clang-tidy file in the root directory
        -- and add Checks key, see https://clang.llvm.org/extra/clang-tidy/
        "--clang-tidy",
        "--clang-tidy-checks=-*,cppcoreguidelines-*,google-*,performance-*,clang-analyzer-*,portability-*,readability-*,modernize-*",
        "--header-insertion=iwyu",
    }
})

require('lspconfig').lua_ls.setup({
    settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
        },
    },
})

lsp.setup()

