local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	vim.cmd([[packadd packer.nvim]])
end

local ok, packer = pcall(require, "packer")
if not ok then
	vim.notify("Packer not found!")
	return
end

packer.init({
	display = { open_fn = require("packer.util").float },
	compile_path = fn.stdpath("data")
		.. "/site/pack/loader/start/packer.nvim/plugin/packer.lua",
})

return require("packer").startup(function(use)
	use({
		"wbthomason/packer.nvim",
		commit = "494fd5999b19e29992eb0978c4fa8988d2023ad8",
	})
	use({
		"nvim-lua/plenary.nvim",
		commit = "986ad71ae930c7d96e812734540511b4ca838aa2",
	})
	use({
		"kyazdani42/nvim-web-devicons",
		commit = "2d02a56189e2bde11edd4712fea16f08a6656944",
	})

	use(require("plugins.colorscheme"))
	use(require("plugins.treesitter"))
	use(require("plugins.completion"))
	use(require("plugins.lsp"))
	use(require("plugins.telescope"))
	use(require("plugins.autopairs"))
	use(require("plugins.comment"))
	use(require("plugins.nvim-tree"))
	use(require("plugins.toggleterm"))
	use(require("plugins.lualine"))
  use(require("plugins.vimtex"))

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
