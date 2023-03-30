local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

telescope.load_extension("media_files")
telescope.load_extension("file_browser")

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local fb_actions = telescope.extensions.file_browser.actions

keymap("n", "<leader>ff", builtin.find_files, opts)
keymap("n", "<leader>fg", builtin.git_files, opts)
keymap("n", "<leader>fk", builtin.keymaps, opts)
keymap("n", "<leader>fr", builtin.live_grep, opts)
keymap("n", "<leader>fo", telescope.extensions.file_browser.file_browser, opts)
keymap("n", "<leader>fp", telescope.extensions.projects.projects, opts)

telescope.setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		mappings = {
			i = {
				["<C-h>"] = fb_actions.toggle_hidden,
				["<C-t>"] = fb_actions.create,
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-c>"] = actions.close,
				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["<CR>"] = actions.select_default,
				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,
				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,
				["<Tab>"] = actions.toggle_selection
					+ actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection
					+ actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist
					+ actions.open_qflist,
				["<C-l>"] = actions.complete_tag,
			},
			n = {
				["<C-h>"] = fb_actions.toggle_hidden,
				["<C-n>"] = fb_actions.create,
				["<esc>"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,
				["<Tab>"] = actions.toggle_selection
					+ actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection
					+ actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist
					+ actions.open_qflist,
				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,
				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,
				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,
				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,
			},
		},
	},
	extensions = {
		media_files = {
			filetypes = { "png", "webp", "jpg", "jpeg" },
			find_cmd = "rg",
		},
		find_files = {
			grouped = true,
		},
	},
})
