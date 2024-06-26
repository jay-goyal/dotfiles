local status_ok_dap, dap = pcall(require, "dap")
local status_ok_vir, dap_vir = pcall(require, "nvim-dap-virtual-text")
local status_ok_ui, dap_ui = pcall(require, "dapui")
local status_ok_wid, dap_wid = pcall(require, "dap.ui.widgets")
local status_ok_mas, mason_dap = pcall(require, "mason-nvim-dap")
local status_ok_mas_reg, mason_registry = pcall(require, "mason-registry")
if
	not (
		status_ok_dap
		and status_ok_vir
		and status_ok_ui
		and status_ok_wid
		and status_ok_mas
		and status_ok_mas_reg
	)
then
	return
end

keymap("n", "<leader>bb", dap.toggle_breakpoint, opts)
keymap("n", "<leader>bc", dap.continue, opts)
keymap("n", "<leader>bn", dap.step_over, opts)
keymap("n", "<leader>bN", dap.step_into, opts)
keymap("n", "<leader>bt", dap_ui.toggle, opts)
keymap("n", "<leader>br", function()
	dap_ui.open({ reset = true })
end, opts)
keymap({ "n", "v" }, "<leader>bh", dap_wid.hover, opts)

dap_vir.setup()

mason_dap.setup({
	ensure_installed = { "codelldb", "python" },
	handlers = {}, -- sets up dap in the predefined manner
})

dap.adapters.codelldb = {
	type = "server",
	host = "127.0.0.1",
	port = 13000,
}

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input(
				"Path to executable: ",
				vim.fn.getcwd() .. "/",
				"file"
			)
		end,
		command = "/usr/bin/lldb-vscode", -- adjust as needed
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
	},
}

dap.configurations.c = dap.configurations.cpp

-- DAP UI
dap_ui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
	dap_ui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dap_ui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dap_ui.close()
end
