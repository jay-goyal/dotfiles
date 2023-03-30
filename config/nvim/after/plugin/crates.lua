local status_ok_null, null_ls = pcall(require, "null-ls")
local status_ok_crates, crates = pcall(require, "crates")
if not (status_ok_null and status_ok_crates) then
    return
end

crates.setup({
    null_ls = {
        enabled = true,
        name = "crates.nvim"
    },
    popup = {
        autofocus = true
    }
})

-- Keymaps
keymap("n", "<leader>rcv", crates.show_versions_popup, opts)
keymap("n", "<leader>rcf", crates.show_features_popup, opts)
keymap("n", "<leader>rcd", crates.show_dependencies_popup, opts)
keymap("n", "<leader>rcD", crates.open_documentation, opts)
keymap("n", "<leader>rcR", crates.open_repository, opts)
