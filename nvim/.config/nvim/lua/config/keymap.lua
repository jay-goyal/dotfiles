keymap = vim.keymap.set
opts = { noremap = true, silent = true }
local rem_opts = { silent = true }
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "
keymap("i", "jk", "<Esc>", rem_opts)

-- Split navigation
--[[ keymap("n", "<C-h>", "<C-w>h", opts) ]]
--[[ keymap("n", "<C-j>", "<C-w>j", opts) ]]
--[[ keymap("n", "<C-k>", "<C-w>k", opts) ]]
--[[ keymap("n", "<C-l>", "<C-w>l", opts) ]]

-- Split resizing
keymap("n", "<C-Left>", ":vertical resize -3<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +3<CR>", opts)
keymap("n", "<C-Up>", ":resize -3<CR>", opts)
keymap("n", "<C-Down>", ":resize +3<CR>", opts)

-- Copy and Pasting from system keyboards
keymap("v", "<leader>p", "\"_dP", opts)
keymap("n", "<leader>p", "\"+p", opts)
keymap("n", "<leaderP", "\"+P", opts)
keymap("n", "<leader>y", "\"+y", opts)
keymap("v", "<leader>y", "\"+y", opts)
keymap("n", "<leader>Y", "\"+Y", opts)
keymap("n", "<leader>d", "\"_d", opts)
keymap("v", "<leader>d", "\"_d", opts)

-- Buffer Navigation
keymap("n", "<leader>q", ":bp<bar>sp<bar>bn<bar>bd<CR>", opts)
keymap("n", "<C-e>", function()
	local result = vim.treesitter.get_captures_at_cursor(0)
	print(vim.inspect(result))
end, opts)

-- Misc
keymap("n", "<leader>so", ":source %<CR>", opts)
keymap("n", "<leader>sp", ":Lazy<CR>", opts)
keymap("n", "<leader>gs", ":Mason<CR>", opts)

-- File
keymap("n", "<leader>ft", ":Oil<CR>", opts)

-- Page Navigation
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Quickfix List
keymap("n", "<C-n>", ":cn<CR>", opts)
keymap("n", "<C-p>", ":cp<CR>", opts)

-- Noice nvim
keymap("n", "<leader>nd", ":NoiceDismiss<CR>", opts)

-- Trouble
keymap("n", "<leader>gtq", function()
	require("trouble").toggle("quickfix")
end, opts)

-- Indents
keymap("x", "<", "<gv")
keymap("x", ">", ">gv")
