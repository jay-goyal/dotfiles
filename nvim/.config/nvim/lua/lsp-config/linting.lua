local status_ok, nvim_lint = pcall(require, "nvim-lint")
if not status_ok then
	return
end

nvim_lint.formatter_by_ft = {
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	svelte = { "eslint_d" },
	css = { "eslint_d" },
	html = { "eslint_d" },
	json = { "eslint_d" },
	yaml = { "eslint_d" },
	markdown = { "eslint_d" },
	python = { "ruff" },
}
