local M =
	{ "hrsh7th/nvim-cmp", commit = "9897465a7663997b7b42372164ffc3635321a2fe" }
M.requires = {
	{
		"hrsh7th/cmp-nvim-lsp",
		commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8",
	},
	{
		"hrsh7th/cmp-buffer",
		commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323",
	},
	{
		"hrsh7th/cmp-path",
		commit = "981baf9525257ac3269e1b6701e376d6fbff6921",
	},

	{
		"SirVer/ultisnips",
		commit = "1edcb40ce749c47d5da42ab02dcdf21f9279bfbb",
	},
	{
		"quangnguyen30192/cmp-nvim-ultisnips",
		commit = "21f02b62deb409ce69928a23406076bd0043ddbc",
	},
	{
		"honza/vim-snippets",
		commit = "222cf7b44bb569c9a046a9891000c898bd4c43c9",
	},
}
M.config = function()
	local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
	local cmp = require("cmp")

	cmp.setup({
		snippet = {
			expand = function(args)
				vim.fn["UltiSnips#Anon"](args.body)
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }),

			["<C-k>"] = cmp.mapping.select_prev_item({
				behavior = cmp.SelectBehavior.Select,
			}),
			["<C-j>"] = cmp.mapping.select_next_item({
				behavior = cmp.SelectBehavior.Select,
			}),
			["<C-l>"] = cmp.mapping.confirm({ select = true }),

			["<Tab>"] = cmp.mapping(function(fallback)
				cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
			end, {
				"i",
				"s", --[[ "c" (to enable the mapping in command mode) ]]
			}),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				cmp_ultisnips_mappings.jump_backwards(fallback)
			end, {
				"i",
				"s", --[[ "c" (to enable the mapping in command mode) ]]
			}),
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "ultisnips" },
			{ name = "buffer" },
			{ name = "path" },
		}),
	})
end
return M
