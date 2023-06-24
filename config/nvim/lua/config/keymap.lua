keymap = vim.keymap.set
opts_loc = { noremap = true, silent = true }
local rem_opts = { silent = true }
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "
keymap("i", "jk", "<Esc>", rem_opts)

-- Split navigation
keymap("n", "<C-h>", "<C-w>h", opts_loc)
keymap("n", "<C-j>", "<C-w>j", opts_loc)
keymap("n", "<C-k>", "<C-w>k", opts_loc)
keymap("n", "<C-l>", "<C-w>l", opts_loc)

-- Split resizing
keymap("n", "<C-Left>", ":vertical resize -3<CR>", opts_loc)
keymap("n", "<C-Right>", ":vertical resize +3<CR>", opts_loc)
keymap("n", "<C-Up>", ":resize -3<CR>", opts_loc)
keymap("n", "<C-Down>", ":resize +3<CR>", opts_loc)

-- Copy and Pasting from system keyboards
keymap("v", "<leader>p", "\"_dP", opts_loc)
keymap("n", "<leader>p", "\"+p", opts_loc)
keymap("n", "<leaderP", "\"+P", opts_loc)
keymap("n", "<leader>y", "\"+y", opts_loc)
keymap("v", "<leader>y", "\"+y", opts_loc)
keymap("n", "<leader>Y", "\"+Y", opts_loc)
keymap("n", "<leader>d", "\"_d", opts_loc)
keymap("v", "<leader>d", "\"_d", opts_loc)

-- Buffer Navigation
keymap("n", "<leader>q", ":bp<bar>sp<bar>bn<bar>bd<CR>", opts_loc)

-- NVIM Tree
keymap("n", "<leader>ft", ":NvimTreeToggle<CR>", opts_loc)
keymap("n", "<leader>fF", ":NvimTreeFocus<CR>", opts_loc)

-- Misc
keymap("n", "<leader>so", ":source %<CR>", opts_loc)
keymap("n", "<leader>gs", ":Mason<CR>", opts_loc)
