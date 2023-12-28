local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

local packages = {
    -- Themes
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},

	-- File Explorer
	{
		"stevearc/oil.nvim",
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update =
				require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},
	"HiPhish/rainbow-delimiters.nvim",

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

	-- TMUX
	"christoomey/vim-tmux-navigator",

	-- Git
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"sindrets/diffview.nvim",
			"ibhagwan/fzf-lua",
		},
		config = true,
	},

	-- Misc
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}

local lazy_opts = {
	ui = {
		border = "rounded",
	},
}

lazy.setup(packages, lazy_opts)
