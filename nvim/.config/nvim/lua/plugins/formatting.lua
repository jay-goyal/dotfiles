return {
    "zapling/mason-conform.nvim",
    opts = {},
    dependencies = {
        "stevearc/conform.nvim",
        dependencies = { "mason-org/mason.nvim" },
        config = function()
            local conform = require("conform")
            conform.setup({
                formatters_by_ft = {
                    c = { "clang-format" },
                    cpp = { "clang-format" },
                    lua = { "stylua" },
                    python = { "ruff_organize_imports", "ruff_format" },
                },
                format_on_save = {
                    lsp_fallback = true,
                    async = false,
                    timeout = 500,
                },
            })

            keymap({ "n", "v" }, "<leader>lf", function()
                conform.format({
                    lsp_fallback = true,
                    async = false,
                    timeout = 500,
                })
            end, opts)
        end,
    },
}
