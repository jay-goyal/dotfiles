local status_ok, oil = pcall(require, "oil")
if not status_ok then
	return
end

oil.setup({
	skip_confirm_for_simple_edits = true,
	keymaps = {
		["H"] = "actions.parent",
	},
	view_options = {
		show_hidden = true,
	},
})
