local servers = { 'sumneko_lua', 'pyright' }

local lsp_installer = require('nvim-lsp-installer')
lsp_installer.setup({
  ensure_installed = servers
})

local lspconfig = require("lspconfig")

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("plugins.lsp.on_attach"),
		capabilities = require("plugins.lsp.capabilities"),
	}

	local has_custom_opts, server_custom_opts = pcall(require, "plugins.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end

	lspconfig[server].setup(opts)
end
