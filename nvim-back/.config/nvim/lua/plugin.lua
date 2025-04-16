local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

local packages = {
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
}

local lazy_opts = {
	ui = {
		border = "rounded",
	},
	install = { colorscheme = { "tokyonight" } },
}

lazy.setup(packages, lazy_opts)
