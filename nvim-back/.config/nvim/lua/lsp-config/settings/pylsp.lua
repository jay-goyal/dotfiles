local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

lspconfig["pylsp"].setup({
	settings = {
		pylsp = {
			plugins = {
				pyflakes = { enabled = false },
				pycodestyle = { enabled = false },
				autopep8 = { enabled = false },
				yapf = { enabled = false },
				mccabe = { enabled = false },
				pylsp_mypy = { enabled = false },
				pylsp_black = { enabled = false },
				pylsp_isort = { enabled = false },
			},
		},
	},
})
