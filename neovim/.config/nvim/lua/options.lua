local opts = {
	number = true,
	relativenumber = true,

	swapfile = false,
	undofile = true,

	incsearch = true,
	hlsearch = false,

	expandtab = true,
	shiftwidth = 2,
	tabstop = 2,

	fileencoding = "utf-8",
	wrap = false,
	scrolloff = 8,
	signcolumn = "yes",
	colorcolumn = "81",
	updatetime = 300,
	termguicolors = true,
	pumheight = 10,
	autoread = true,
}

for opt, val in pairs(opts) do
	vim.opt[opt] = val
end
