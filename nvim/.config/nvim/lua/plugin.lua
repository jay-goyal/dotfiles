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
		opts = {
			style = "night",
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
		on_highlights = function(hl, colors)
			hl.WinBar = { bg = "NONE", fg = colors.fg }
			hl.WinBarNC = { bg = "NONE", fg = colors.fg_dark }
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			-- "rcarriga/nvim-notify",
		},
	},

	-- File Explorer
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Cmp Plugins
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			{ "hrsh7th/cmp-nvim-lua", ft = "lua" },
		},
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

	-- Coding
	{ "windwp/nvim-autopairs", event = "InsertEnter" }, -- Autopairs, integrates with both cmp and treesitter
	"hiphish/rainbow-delimiters.nvim",
	"lewis6991/gitsigns.nvim",

	-- Snippets
	"L3MON4D3/LuaSnip", --snippet engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets to use

	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Status Line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	},
	{
		"SmiteshP/nvim-navic",
		dependencies = { "neovim/nvim-lspconfig" },
	},

	-- LSP
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
	"folke/neoconf.nvim",

	-- DAP
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
			"theHamsta/nvim-dap-virtual-text",
		},
	},

	-- Rust
	{
		"saecki/crates.nvim",
		ft = { "toml", "rust" },
	},

	-- Python
	{
		"mfussenegger/nvim-dap-python",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},

	-- Markdown
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
	},

	-- TMUX
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
}

local lazy_opts = {
	ui = {
		border = "rounded",
	},
	install = { colorscheme = { "tokyonight" } },
}

lazy.setup(packages, lazy_opts)
