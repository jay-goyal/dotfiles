local servers = {
	"lua_ls",
	"jsonls",
	"rust_analyzer",
	"pyright",
	"clangd",
	"dockerls",
}

local settings = {
	ui = {
		border = "rounded",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

require("mason-null-ls").setup({
	ensure_installed = nil,
	automatic_installation = { exclude = { "rustfmt" } },
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end
local handlers = require("lsp-config.handlers")

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = handlers.on_attach,
		capabilities = handlers.capabilities,
	}

	server = vim.split(server, "@")[1]

	lspconfig[server].setup(opts)
end
