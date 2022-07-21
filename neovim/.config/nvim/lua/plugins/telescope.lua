local M = {
	"nvim-telescope/telescope.nvim",
	commit = "8c563017200bebd76153feb1046ecdf2db26c9d4",
}
M.requires = {
	{
		"BurntSushi/ripgrep",
		commit = "87b33c96c02b5d728324632956d301ef3d234f80",
	},
}
M.config = function()
	local opts = { noremap = true, silent = true }
	vim.api.nvim_set_keymap(
		"n",
		"<Leader>ff",
		":Telescope find_files<CR>",
		opts
	)
	vim.api.nvim_set_keymap("n", "<Leader>fg", ":Telescope live_grep<CR>", opts)
	vim.api.nvim_set_keymap("n", "<Leader>fb", ":Telescope buffers<CR>", opts)
	vim.api.nvim_set_keymap("n", "<Leader>fh", ":Telescope help_tags<CR>", opts)

	local actions = require("telescope.actions")

	require("telescope").setup({
		defaults = {
			mappings = {
				i = {
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					["<C-l>"] = actions.select_default,
				},
				n = {
					["l"] = actions.select_default,
				},
			},
		},
	})
end
return M
