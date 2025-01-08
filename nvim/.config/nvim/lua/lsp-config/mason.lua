local servers = {
	"lua_ls",
	"jsonls",
	"clangd",
	"pylsp",
	"ruff",
	"asm_lsp",
	"tailwindcss",
	"ts_ls",
	"eslint",
	"rust_analyzer",
	"zls",
	"gopls",
}

local settings = {
	ui = {
		border = "rounded",
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
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
