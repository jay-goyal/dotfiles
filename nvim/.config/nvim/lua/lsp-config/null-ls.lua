local null_ls_status_ok, null_ls = pcall(require, "null-ls")
local mason_null_status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not (null_ls_status_ok and mason_null_status_ok) then
	return
end

local formatting = null_ls.builtins.formatting
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
		formatting.rustfmt,
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.clang_format.with({
			extra_args = {
				"--style",
				"\"{BasedOnStyle: Google, IndentWidth: 4}\"",
			},
		}),
		diagnostics.ruff,
	},
})
