local M = {
	"nvim-treesitter/nvim-treesitter",
	commit = "31f8af5c13314567f8ec15d947c61d6c22206639",
}
M.run = function()
	require("nvim-treesitter.install").update({ with_sync = true })
end
M.config = function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = "all",
		sync_install = false,
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
	})
	--vim.opt.foldmethod = "expr"
	--vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
	--vim.opt.foldminlines = 16
	--vim.opt.foldnestmax = 1
end
return M
