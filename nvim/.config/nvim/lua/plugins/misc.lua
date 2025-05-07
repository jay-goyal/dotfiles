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
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	"hiphish/rainbow-delimiters.nvim",
}
