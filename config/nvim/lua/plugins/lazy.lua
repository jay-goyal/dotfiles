local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

local packages = {
	-- Themes
	{ "catppuccin/nvim", name = "catppuccin" },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},

	-- File Manager
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = "nvim-tree/nvim-web-devicons",
	},

	-- Startup screen
	"goolord/alpha-nvim",

	-- LSP
	"neovim/nvim-lspconfig", -- enable LSP
	"williamboman/mason.nvim", -- simple to use language server installer
	"williamboman/mason-lspconfig.nvim", -- simple to use language server installer
	"jose-elias-alvarez/null-ls.nvim", -- LSP diagnostics and code actions
	"jay-babu/mason-null-ls.nvim",
	"tamago324/nlsp-settings.nvim",
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- DAP
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"theHamsta/nvim-dap-virtual-text",
	"jay-babu/mason-nvim-dap.nvim",

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update =
				require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},
	"HiPhish/nvim-ts-rainbow2",

	-- Coding
	"lukas-reineke/indent-blankline.nvim",
	"windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
	"numToStr/Comment.nvim", -- Easily comment stuff
	"JoosepAlviste/nvim-ts-context-commentstring",
	"lewis6991/gitsigns.nvim",

	-- Cmp Plugins
	"hrsh7th/nvim-cmp", -- The completion plugin
	--[[ "hrsh7th/cmp-buffer", -- buffer completions ]]
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline", -- cmdline completions
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"hrsh7th/cmp-nvim-lsp",
	{ "hrsh7th/cmp-nvim-lua", ft = "lua" },

	-- Snippets
	"L3MON4D3/LuaSnip", --snippet engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets to use

	-- Rust
	{
		"saecki/crates.nvim",
		version = "v0.3.0",
		ft = { "toml", "rust" },
	},
	{ "simrat39/rust-tools.nvim", ft = "rust" },

	-- Go
	{ "leoluz/nvim-dap-go", ft = "go" },

	-- Python
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		config = function(_, opts)
			local path =
				"~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
		end,
	},
	{ "AckslD/swenv.nvim", ft = "python" },

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.1",
		-- or                          , branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	"nvim-telescope/telescope-media-files.nvim",
	"ahmedkhalf/project.nvim",
	"nvim-telescope/telescope-file-browser.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

	-- Status Line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	},
	{
		"utilyre/barbecue.nvim",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
	},

	-- Misc
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	"NvChad/nvim-colorizer.lua",
	"tpope/vim-sleuth",
	"tpope/vim-surround",
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	"MunifTanjim/nui.nvim",
	"rcarriga/nvim-notify",
	"stevearc/dressing.nvim",
	"ggandor/leap.nvim",
	"tpope/vim-repeat",
	"windwp/nvim-ts-autotag",
}

local lazy_opts = {
	ui = {
		border = "rounded",
	},
}

lazy.setup(packages, lazy_opts)
