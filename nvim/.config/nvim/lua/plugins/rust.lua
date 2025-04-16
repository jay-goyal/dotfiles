return {
	"saecki/crates.nvim",
	ft = { "toml", "rust" },
	keys = {
		{
			"<leader>grcv",
			mode = { "n" },
			function()
				require("crates").show_versions_popup()
			end,
		},
		{
			"<leader>grcf",
			mode = { "n" },
			function()
				require("crates").show_features_popup()
			end,
		},
		{
			"<leader>grcd",
			mode = { "n" },
			function()
				require("crates").show_dependencies_popup()
			end,
		},
		{
			"<leader>grcD",
			mode = { "n" },
			function()
				require("crates").open_documentation()
			end,
		},
		{
			"<leader>grcR",
			mode = { "n" },
			function()
				require("crates").open_repository()
			end,
		},
	},
	opts = {
		null_ls = {
			enabled = true,
			name = "crates.nvim",
		},
		cmp = {
			enabled = true,
		},
		popup = {
			autofocus = true,
		},
	},
}
