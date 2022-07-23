local M =
	{ "lervag/vimtex", commit = "873c02300817edd5ad6bf27ba135f26f8037db65" }
M.config =function ()
  vim.g.vimtex_view_method = 'zathura'
end
return M
