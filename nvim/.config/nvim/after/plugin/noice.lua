local status_ok, noice = pcall(require, "noice")
if not status_ok then
	return
end

noice.setup({
	lsp = {
		progress = { enabled = true },
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["mp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
		},
	},
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = false,
		command_palette = true,
		long_message_to_split = true,
		inc_rename = false,
		lsp_doc_border = true,
	},

	-- views = {
	-- 	notify = {
	-- 		max_height = 5,
	-- 		width = "30%",
	-- 	},
	-- },
})
