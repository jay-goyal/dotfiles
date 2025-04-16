return {
	-- TMUX Navigation
	"christoomey/vim-tmux-navigator",

	-- Indent Guides
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},

	-- Misc
	"tpope/vim-sleuth",
	{
		"tpope/vim-surround",
		dependencies = { "tpope/vim-repeat" },
	},
	"windwp/nvim-ts-autotag",
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Hard Time - Train me for navigation
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = { disable_mouse = false },
	},
	"hiphish/rainbow-delimiters.nvim",
}
