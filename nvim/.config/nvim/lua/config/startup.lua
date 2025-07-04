local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

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
    wrap = true,
    signcolumn = "yes",
    cursorline = true,
    termguicolors = true,
    scrolloff = 15,
    updatetime = 50,
}

local globals = {}

for k, v in pairs(options) do
    opt[k] = v
end

for k, v in pairs(globals) do
    g[k] = v
end

opt.isfname:append("@-@")
