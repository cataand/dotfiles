local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	sources = {
		formatting.stylua.with({ extra_args = { "--column-width", "80" } }),
		formatting.black,
	},
})
