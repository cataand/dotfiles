local M = {
	"neovim/nvim-lspconfig",
	commit = "41a826947eefbc7b59cc80cef405cce9ea6d82b8",
}
M.requires = {
	{
		"williamboman/nvim-lsp-installer",
		commit = "087863896458195a7337475c66409e1ab5f5e802",
	},
	{
		"RRethy/vim-illuminate",
		commit = "6bfa5dc069bd4aa8513a3640d0b73392094749be",
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		commit = "3651217135b465acb671d404c2534d5c8762af86",
	},
}

M.config = function()
	require("plugins.lsp.configs")
	require("plugins.lsp.null-ls")
end
return M
