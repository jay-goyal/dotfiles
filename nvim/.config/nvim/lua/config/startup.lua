local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt
Color = Color or "tokyonight-night"

local options = {
	-- Indents
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
	expandtab = true,
	smartindent = true,

	-- Line Numbers
	number = true,
	relativenumber = true,

	-- Search
	smartcase = true,
	ignorecase = true,
	hlsearch = false,
	incsearch = true,

	-- Splits
	splitbelow = true,
	splitright = true,

	-- Misc
	hidden = true,
	errorbells = false,
	wrap = false,
	signcolumn = "yes",
	cursorline = false,
	termguicolors = true,
	scrolloff = 15,
	updatetime = 50,
}

for k, v in pairs(options) do
	opt[k] = v
end

opt.isfname:append("@-@")
