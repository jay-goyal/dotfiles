return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require("dap")
		local dap_ui = require("dapui")
		local dap_wid = require("dap.ui.widgets")
		local mason_dap = require("mason-nvim-dap")
		local mason_registry = require("mason-registry")

		local function terminate()
			dap.terminate()
			dap_ui.close()
		end

		keymap("n", "<leader>bb", dap.toggle_breakpoint, opts)
		keymap("n", "<leader>bc", dap.continue, opts)
		keymap("n", "<leader>bn", dap.step_over, opts)
		keymap("n", "<leader>bN", dap.step_into, opts)
		keymap("n", "<leader>bo", dap.step_out, opts)
		keymap("n", "<leader>bt", dap_ui.toggle, opts)
		keymap("n", "<leader>br", dap.restart, opts)
		keymap("n", "<leader>bT", terminate)
		keymap({ "n", "v" }, "<leader>bh", dap_wid.hover, opts)

		mason_dap.setup({
			ensure_installed = { "codelldb", "python" },
			handlers = {}, -- sets up dap in the predefined manner
		})

		-- DAP UI
		dap_ui.setup({
			icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
			controls = {
				icons = {
					pause = "⏸",
					play = "▶",
					step_into = "⏎",
					step_over = "⏭",
					step_out = "⏮",
					step_back = "b",
					run_last = "▶▶",
					terminate = "⏹",
					disconnect = "⏏",
				},
			},
		})

		vim.fn.sign_define(
			"DapStopped",
			{ text = "", texthl = "DiagnosticWarn" }
		)
		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = "", texthl = "DiagnosticInfo" }
		)
		vim.fn.sign_define(
			"DapBreakpointRejected",
			{ text = "", texthl = "DiagnosticError" }
		)
		vim.fn.sign_define(
			"DapBreakpointCondition",
			{ text = "", texthl = "DiagnosticInfo" }
		)
		vim.fn.sign_define(
			"DapLogPoint",
			{ text = ".>", texthl = "DiagnosticInfo" }
		)

		dap.listeners.before.attach["dapui_config"] = function()
			dap_ui.open()
		end
		dap.listeners.before.launch["dapui_config"] = function()
			dap_ui.open()
		end
		-- dap.listeners.before.event_terminated["dapui_config"] = function()
		-- 	dap_ui.close()
		-- end
		-- dap.listeners.before.event_exited["dapui_config"] = function()
		-- 	dap_ui.close()
		-- end
	end,
}
