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
		opts = { style = "night" },
	},

	-- File Explorer
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Cmp Plugins
	"hrsh7th/nvim-cmp", -- The completion plugin
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline", -- cmdline completions
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"hrsh7th/cmp-nvim-lsp",
	{ "hrsh7th/cmp-nvim-lua", ft = "lua" },

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
	{ "windwp/nvim-autopairs", event = "InsertEnter" }, -- Autopairs, integrates with both cmp and treesitter
	"lewis6991/gitsigns.nvim",

	-- Snippets
	"L3MON4D3/LuaSnip", --snippet engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets to use

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"nvim-telescope/telescope-ui-select.nvim",

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

	-- LSP
	"neovim/nvim-lspconfig", -- enable LSP
	{
		"williamboman/mason.nvim",
		dependencies = "williamboman/mason-lspconfig.nvim",
	},
	"williamboman/mason-lspconfig.nvim",
	"nvimtools/none-ls.nvim",
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
	},

	-- DAP
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"jay-babu/mason-nvim-dap.nvim",
		},
	},

	-- Rust
	{
		"saecki/crates.nvim",
		ft = { "toml", "rust" },
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^5", -- Recommended
		lazy = false, -- This plugin is already lazy
	},

	-- TMUX
	"christoomey/vim-tmux-navigator",

	-- Misc
	"tpope/vim-sleuth",
	"tpope/vim-surround",
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
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