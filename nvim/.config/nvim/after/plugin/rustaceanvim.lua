local lspconfig = require("lspconfig")
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

vim.g.rustaceanvim = {
  server = {
	on_attach = lspconfig.util.add_hook_after(
		format_on_save,
		require("lsp-config.handlers").on_attach
	),
  },
}
keymap("n", "<leader>grk", ":RustLsp hover actions<CR>", opts)
keymap("n", "<leader>grcc", ":RustLsp openCargo<CR>", opts)
keymap("n", "<leader>grp", ":RustLsp parentModule<CR>", opts)
keymap("n", "<leader>brt", ":RustLsp debuggables<CR>", opts)
