local servers = { "sumneko_lua", "pyright" }

vim.diagnostic.config({
	update_in_insert = true,
	severity_sort = true,
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

vim.diagnostic.config({
	update_in_insert = true,
	underline = true,
	severity_sort = true,
})

require("nvim-lsp-installer").setup({
	ensure_installed = servers,
})

local lspconfig = require("lspconfig")
local handlers = {
	capabilities = require("plugins.lsp.capabilities"),
	on_attach = require("plugins.lsp.on_attach"),
}

for _, server in ipairs(servers) do
	local has_custom_opts, custom_opts =
		pcall(require, "plugins.lsp.settings." .. server)
	if has_custom_opts then
		custom_opts = vim.tbl_deep_extend("force", handlers, custom_opts)
	else
		custom_opts = handlers
	end

	lspconfig[server].setup(custom_opts)
end
