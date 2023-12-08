local servers = {
	"lua_ls",
	"tsserver",
	"svelte",
	"cssls",
	"jsonls",
	"rust_analyzer",
	"pyright",
	"clangd",
	"emmet_ls",
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
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("lsp-config.handlers").on_attach,
		capabilities = require("lsp-config.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	lspconfig[server].setup(opts)
end
