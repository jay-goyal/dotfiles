local status_ok, conform = pcall(require, "conform")
if not status_ok then
	return
end

local stylua = require("conform.formatters.stylua")
local util = require("conform.util")

conform.setup({
	formatters = {
		stylua = {
			args = util.extend_args(stylua.args, {
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
			})
		}
	},
	formatter_by_ft = {
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		svelte = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		lua = { "stylua" },
		rust = { "rustfmt" },
		python = { "isort", "black" },
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	},
})
