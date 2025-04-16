local function format_on_save(client, bufnr)
	vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = augroup,
		buffer = bufnr,
		callback = function()
			vim.lsp.buf.format({ bufnr = bufnr })
		end,
	})
end

local lspconfig = require("lspconfig")
lspconfig["rust-analyzer"].setup({
	on_attach = lspconfig.util.add_hook_after(
		format_on_save,
		require("lsp-config.handlers").on_attach
	),
})
