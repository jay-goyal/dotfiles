local null_ls_status_ok, null_ls = pcall(require, "null-ls")
local mason_null_status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not (null_ls_status_ok and mason_null_status_ok) then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({
			group = augroup,
			buffer = bufnr,
		})
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end,
		})
	end
end

null_ls.setup({
	on_attach = on_attach,
	sources = {
		-- FORMATTING
		formatting.stylua.with({
			extra_args = {
				"--call-parentheses",
				"Always",
				"--quote-style",
				"ForceDouble",
				"--column-width",
				"80",
				"--indent-type",
				"Tabs",
				"--indent-width",
				"4",
			},
		}),
		formatting.clang_format.with({
			extra_args = {
				"-style='{BasedOnStyle: Google, IndentWidth: 4}'",
			},
		}),
		formatting.black,
		formatting.prettierd,
		formatting.leptosfmt,
		formatting.gofmt,

		-- DIAGNOSTICS
		-- diagnostics.pylint,
	},
})

mason_null_ls.setup({
	ensure_installed = nil,
	automatic_installation = true,
})
