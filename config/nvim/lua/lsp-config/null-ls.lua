local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local on_attach = function(client)
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format()
        end,
    })
end

null_ls.setup({
    debug = false,
    on_attach = on_attach,
    sources = {
        formatting.prettier.with({
            extra_filetypes = { "svelte", "html" },
        }),
        formatting.stylua.with({
            extra_args = {
                "--call-parentheses",
                "Always",
                "--quote-style",
                "AutoPreferDouble",
                "--column-width",
                "80",
                "--indent_type",
                "Tabs",
                "--indent_width",
                "4"
            },
        }),
        formatting.rustfmt,
        formatting.google_java_format,
        formatting.black.with({ extra_args = { "--fast" } }),
        formatting.sqlfluff,
        formatting.clang_format,
        diagnostics.eslint_d.with({ extra_filetypes = { "svelte" } }),
        diagnostics.sqlfluff.with({ extra_args = { "--dialect", "mysql" } }),
        --[[ diagnostics.cpplint, ]]
    }
})
