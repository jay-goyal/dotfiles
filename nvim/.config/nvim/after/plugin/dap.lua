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
keymap("n", "<leader>bo", dap.step_out, opts)
keymap("n", "<leader>bt", dap_ui.toggle, opts)
keymap("n", "<leader>br", dap.restart, opts)
keymap({ "n", "v" }, "<leader>bh", dap_wid.hover, opts)

dap_vir.setup()

mason_dap.setup({
	ensure_installed = { "codelldb" },
	handlers = {}, -- sets up dap in the predefined manner
})

-- DAP UI
dap_ui.setup()

dap.listeners.before.attach["dapui_config"] = function()
	dap_ui.open()
end
dap.listeners.before.launch["dapui_config"] = function()
	dap_ui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dap_ui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dap_ui.close()
end
