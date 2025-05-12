return {
	"neovim/nvim-lspconfig", -- enable LSP
	{
		"mason-org/mason.nvim",
		dependencies = { "mason-org/mason-lspconfig.nvim", version = "1.32.0" },
		version = "1.11.0",
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"mason-org/mason.nvim",
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
