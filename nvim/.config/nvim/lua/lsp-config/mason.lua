local servers = {
	"lua_ls",
	"jsonls",
	"clangd",
	"jedi_language_server",
	"asm_lsp",
	"rust_analyzer",
	"ruff",
}

local settings = {
	ui = {
		border = "rounded",
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 6,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig = require("lspconfig")
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
