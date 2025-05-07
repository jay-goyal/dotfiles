local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("lsp-config.handlers").setup()
require("lsp-config.mason")
require("lsp-config.null-ls")
require("lsp-config.settings")

local ns = vim.api.nvim_create_namespace("CurlineDiag")
vim.opt.updatetime = 100
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		vim.api.nvim_create_autocmd("CursorHold", {
			buffer = args.buf,
			callback = function()
				pcall(vim.api.nvim_buf_clear_namespace, args.buf, ns, 0, -1)
				local hi = { "Error", "Warn", "Info", "Hint" }
				local curline = vim.api.nvim_win_get_cursor(0)[1]
				local diagnostics =
					vim.diagnostic.get(args.buf, { lnum = curline - 1 })
				local virt_texts = { { (" "):rep(4) } }
				for _, diag in ipairs(diagnostics) do
					virt_texts[#virt_texts + 1] =
						{ diag.message, "Diagnostic" .. hi[diag.severity] }
				end
				vim.api.nvim_buf_set_extmark(args.buf, ns, curline - 1, 0, {
					virt_text = virt_texts,
					hl_mode = "combine",
				})
			end,
		})
	end,
})
