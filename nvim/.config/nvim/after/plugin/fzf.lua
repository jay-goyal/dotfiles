local status_ok, fzf = pcall(require, "fzf-lua")
if not status_ok then
	return
end

keymap("n", "<leader>ff", "<cmd>FzfLua files<CR>", opts)
keymap("n", "<leader>fg", "<cmd>FzfLua git_files<CR>", opts)
keymap("n", "<leader>fr", "<cmd>FzfLua live_grep<CR>", opts)
keymap("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", opts)
keymap("n", "<leader>fR", "<cmd>FzfLua registers<CR>", opts)
keymap("n", "<leader>fm", "<cmd>FzfLua man_pages<CR>", opts)

fzf.setup({
	winopts = {
		height = 0.80,
		width = 0.87,
		row = 0.3,
		col = 0.5,
		preview = {
			vertical = "up:60%", -- Preview placement
			layout = "horizontal",
			flip_columns = 120,
		},
	},
	keymap = {
		builtin = {
			["<C-n>"] = "down",
			["<C-p>"] = "up",
			["<C-j>"] = "down",
			["<C-k>"] = "up",
			["<C-c>"] = "abort",
		},
		fzf = {
			["ctrl-q"] = "select-all+accept",
		},
	},
	files = {
		prompt = "  ",
		cwd_prompt = false,
		hidden = true, -- Show hidden files
		ignore_current_buffer = true,
		follow = true, -- Follow symlinks
	},
	grep = {
		hidden = true,
		prompt = "Grep   ",
		exec_empty_query = true,
	},
	git = {
		files = {
			prompt = "Git Files   ",
		},
		status = {
			prompt = "Git Status   ",
		},
	},
	registers = {
		prompt = "Registers   ",
	},
	manpages = {
		prompt = "Man Pages   ",
		sections = { "ALL" },
	},
})
