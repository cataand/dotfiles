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
	compile_path = fn.stdpath("data") .. "/site/pack/loader/start/packer.nvim/plugin/packer.lua",
})

local use = packer.use

-- Packer
use({ "wbthomason/packer.nvim", commit = "e4c2afb37d31e99b399425e102c58b091fbc16be" })

use(require("plugins.colorscheme"))
use(require("plugins.completion"))
use(require("plugins.telescope"))
use(require("plugins.lsp"))

if PACKER_BOOTSTRAP then
	require("packer").sync()
end
