local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local rem_opts = { silent = true }
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "
keymap("i", "jk", "<Esc>", rem_opts)

-- Split navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Split resizing
keymap("n", "<C-Left>", ":vertical resize -3<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +3<CR>", opts)
keymap("n", "<C-Up>", ":resize -3<CR>", opts)
keymap("n", "<C-Down>", ":resize +3<CR>", opts)

-- Copy and Pasting from system keyboards
keymap("v", "<leader>p", '"_dP', opts)
keymap("n", "<leader>y", '"+y', opts)
keymap("v", "<leader>y", '"+y', opts)
keymap("n", "<leader>Y", '"+Y', opts)
keymap("n", "<leader>d", '"_d', opts)
keymap("v", "<leader>d", '"_d', opts)
