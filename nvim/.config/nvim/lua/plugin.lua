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

	-- LSP
	"neovim/nvim-lspconfig", -- enable LSP
	{
		"williamboman/mason.nvim", -- simple to use language server installer
		dependencies = "williamboman/mason-lspconfig.nvim", -- simple to use language server installer
	},
	"williamboman/mason-lspconfig.nvim", -- simple to use language server installer
	{ "nvimtools/none-ls.nvim", event = "VeryLazy" },
	"jay-babu/mason-null-ls.nvim",

	-- Rust
	{
		"saecki/crates.nvim",
		ft = { "toml", "rust" },
	},
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		dependencies = "neovim/nvim-lspconfig",
		config = function()
			require("rust-tools").setup()
		end,
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

	-- Coding
	{ "shellRaining/hlchunk.nvim", event = { "UIEnter" } }, -- Scope Highlight
	"windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
	"numToStr/Comment.nvim", -- Easily comment stuff
	"lewis6991/gitsigns.nvim",

	-- Cmp Plugins
	"hrsh7th/nvim-cmp", -- The completion plugin
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline", -- cmdline completions
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"hrsh7th/cmp-nvim-lsp",
	{ "hrsh7th/cmp-nvim-lua", ft = "lua" },

	-- Snippets
	"L3MON4D3/LuaSnip", --snippet engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets to use

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

	-- Status Line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	},
	{
		"utilyre/barbecue.nvim",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
	},

	-- TMUX
	"christoomey/vim-tmux-navigator",

	-- Misc
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	"tpope/vim-sleuth",
	"tpope/vim-surround",
}

local lazy_opts = {
	ui = {
		border = "rounded",
	},
}

lazy.setup(packages, lazy_opts)
