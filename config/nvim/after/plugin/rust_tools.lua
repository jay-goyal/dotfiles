local status_ok, rt = pcall(require, "rust-tools")
if not status_ok then
	return
end

rt.setup({
	server = {
		on_attach = function(_, bufnr)
			keymap(
				"n",
				"<leader>rk",
				":RustHoverActions<CR> :RustHoverActions<CR>",
				{ buffer = bufnr }
			)
			keymap(
				"n",
				"<leader>rcc",
				rt.open_cargo_toml.open_cargo_toml,
				{ buffer = bufnr }
			)
		end,
		standalone = false,
	},
	dap = {
		adapter = {
			type = "executable",
			command = "lldb-vscode",
			name = "rt_lldb",
		},
	},
})
