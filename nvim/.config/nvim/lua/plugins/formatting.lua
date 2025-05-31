return {
  "zapling/mason-conform.nvim",
  dependencies = {
    "stevearc/conform.nvim",
    dependencies = { "mason-org/mason.nvim" },
    config = function()
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          c = { "clang_format" },
          cpp = { "clang_format" },
          lua = { "stylua" },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout = 500,
        },
      })

      keymap({ "n", "v" }, "<leader>gf", function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout = 500,
        })
      end, opts)
    end,
  },
}
