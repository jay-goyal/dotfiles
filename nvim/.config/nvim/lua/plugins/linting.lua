return {
    "rshkarin/mason-nvim-lint",
    opts = {},
    dependencies = {
        "mfussenegger/nvim-lint",
        dependencies = { "mason-org/mason.nvim" },
        config = function()
            local lint = require("lint")
            lint.linters_by_ft = {
                python = { "ruff" },
                sh = { "shellcheck" },
            }
            vim.api.nvim_create_autocmd(
                { "BufEnter", "BufWritePost", "InsertLeave" },
                {
                    callback = function()
                        lint.try_lint()
                    end,
                }
            )
        end,
    },
}
