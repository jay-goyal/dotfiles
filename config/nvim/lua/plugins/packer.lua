local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Themes
	use({ "catppuccin/nvim", as = "catppuccin" })
	--[[ use({ "catppuccin/nvim", as = "catppuccin", commit = "128af65" }) ]]
	use("folke/tokyonight.nvim")

	-- File Manager
	use({
		"nvim-tree/nvim-tree.lua",
		after = "nvim-web-devicons",
		requires = "nvim-tree/nvim-web-devicons",
	})

	-- Startup screen
	use("goolord/alpha-nvim")

	-- LSP
	use("neovim/nvim-lspconfig")          -- enable LSP
	use("williamboman/mason.nvim")        -- simple to use language server installer
	use("williamboman/mason-lspconfig.nvim") -- simple to use language server installer
	use("jay-babu/mason-nvim-dap.nvim")
	use("jose-elias-alvarez/null-ls.nvim") -- LSP diagnostics and code actions
	use("jay-babu/mason-null-ls.nvim")
	use("tamago324/nlsp-settings.nvim")

	-- DAP
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update =
				require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use("HiPhish/nvim-ts-rainbow2")

	-- Coding
	use("lukas-reineke/indent-blankline.nvim")
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("lewis6991/gitsigns.nvim")

	-- Cmp Plugins
	use("hrsh7th/nvim-cmp")      -- The completion plugin
	--[[ use("hrsh7th/cmp-buffer") -- buffer completions ]]
	use("hrsh7th/cmp-path")      -- path completions
	use("hrsh7th/cmp-cmdline")   -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")

	-- Snippets
	use("L3MON4D3/LuaSnip")          --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- Rust
	use({
		"saecki/crates.nvim",
		tag = "v0.3.0",
	})
	use("simrat39/rust-tools.nvim")

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		-- or                          , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("nvim-telescope/telescope-media-files.nvim")
	use("ahmedkhalf/project.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- Status Line
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	use({
		"utilyre/barbecue.nvim",
		tag = "*",
		requires = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		after = "nvim-web-devicons", -- keep this if you're using NvChad
	})

	-- Misc
	use("NvChad/nvim-colorizer.lua")
	use("tpope/vim-sleuth")
	use("tpope/vim-surround")
	use("MunifTanjim/nui.nvim")
	use("rcarriga/nvim-notify")
	use("folke/noice.nvim")
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
		ft = { "markdown" },
	})
	use("ggandor/leap.nvim")
	use("tpope/vim-repeat")
	use("windwp/nvim-ts-autotag")

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
