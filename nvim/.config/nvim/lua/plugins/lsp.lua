return {
	"neovim/nvim-lspconfig", -- enable LSP
	{
		"williamboman/mason.nvim",
		dependencies = "williamboman/mason-lspconfig.nvim",
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls-extras.nvim",
			"nvimtools/none-ls.nvim",
		},
	},
	{
		"folke/neoconf.nvim",
		opts = {
			plugins = {
				rust_analyzer = {
					enabled = true,
				},
			},
		},
	},
}
