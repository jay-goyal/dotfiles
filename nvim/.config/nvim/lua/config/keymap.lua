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

-- Misc
keymap("n", "<leader>so", ":source %<CR>", opts)
keymap("n", "<leader>sp", ":Lazy<CR>", opts)
keymap("n", "<leader>gs", ":Mason<CR>", opts)

-- File
keymap("n", "<leader>ft", ":Oil<CR>", opts)

-- Neogit
keymap("n", "<leader>gg", ":Neogit<CR>", opts)

-- Page Navigation
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
