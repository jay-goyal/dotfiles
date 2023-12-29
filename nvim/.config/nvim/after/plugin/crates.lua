local status_ok_null, null_ls = pcall(require, "null-ls")
local status_ok_crates, crates = pcall(require, "crates")
if not (status_ok_null and status_ok_crates) then
	return
end

crates.setup({
	null_ls = {
		enabled = true,
		name = "crates.nvim",
	},
	cmp = {
		enabled = true,
	},
	popup = {
		autofocus = true,
	},
})

-- Keymaps
keymap("n", "<leader>grcv", crates.show_versions_popup, opts)
keymap("n", "<leader>grcf", crates.show_features_popup, opts)
keymap("n", "<leader>grcd", crates.show_dependencies_popup, opts)
keymap("n", "<leader>grcD", crates.open_documentation, opts)
keymap("n", "<leader>grcR", crates.open_repository, opts)
