local M = {
	"kyazdani42/nvim-tree.lua",
	commit = "630305c233b815464d57bc253444610eb327d255",
}
M.config = function()
	local keymap = vim.api.nvim_set_keymap
	keymap(
		"n",
		"<leader>e",
		":NvimTreeToggle<cr>",
		{ noremap = true, silent = true }
	)

	local nvim_tree_config = require("nvim-tree.config")
	local tree_cb = nvim_tree_config.nvim_tree_callback

	require("nvim-tree").setup({
		disable_netrw = true,
		hijack_cursor = true,
		hijack_netrw = true,
		view = {
			adaptive_size = false,
			centralize_selection = false,
			width = 30,
			height = 30,
			hide_root_folder = false,
			side = "left",
			preserve_window_proportions = false,
			number = false,
			relativenumber = false,
			signcolumn = "yes",
			mappings = {
				custom_only = false,
				list = {
					{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
					{ key = "h", cb = tree_cb("close_node") },
					{ key = "v", cb = tree_cb("vsplit") },
				},
			},
		},
	})
end
return M
