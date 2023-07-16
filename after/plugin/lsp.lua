local lsp = require('lsp-zero').preset({})


lsp.ensure_installed({
	'lua_ls',
	'rust_analyzer',
	'clangd',
	'pyright',
	'cmake'
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<Tab>'] = cmp.mapping.confirm({select = true}),
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	["<C-Space>"] = cmp.mapping.complete()
})

lsp.set_preferences({
	sign_icons = { }
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)

  lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()

