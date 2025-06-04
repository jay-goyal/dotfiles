return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        skip_confirm_for_simple_edits = true,
        keymaps = {
            ["H"] = "actions.parent",
        },
        view_options = {
            show_hidden = true,
        },
    },
}
