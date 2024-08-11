local null_ls_status_ok, null_ls = pcall(require, "null-ls")
local none_ls_status_ok, none_ls = pcall(require, "none-ls")
local mason_null_status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not (null_ls_status_ok and mason_null_status_ok and none_ls_status_ok) then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local extra_formatting = none_ls.formatting

local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
				vim.lsp.buf.format({ bufnr = bufnr })
			end,
		})
	end
end

null_ls.setup({
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
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.clang_format.with({
			extra_args = {
				"--style",
				"\"{BasedOnStyle: Google, IndentWidth: 4}\"",
			},
		}),
	},
})
