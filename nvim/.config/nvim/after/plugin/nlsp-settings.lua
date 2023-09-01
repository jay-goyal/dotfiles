local status_ok_conf, lspconfig = pcall(require, "lspconfig")
local status_ok_set, nlspsettings = pcall(require, "nlspsettings")

if not (status_ok_set and status_ok_conf) then
	return
end

nlspsettings.setup({
	config_home = vim.fn.stdpath("config") .. "/nlsp-settings",
	local_settings_dir = ".nlsp-settings",
	local_settings_root_markers_fallback = { ".git" },
	append_default_schemas = true,
	loader = "json",
})

local global_capabilities = vim.lsp.protocol.make_client_capabilities()
global_capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.util.default_config =
	vim.tbl_extend("force", lspconfig.util.default_config, {
		capabilities = global_capabilities,
	})
