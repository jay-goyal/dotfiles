local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("config.startup")
require("config.keymap")
require("plugin")

-- Theming
vim.cmd.colorscheme("everblush")
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#232a2d" })
vim.api.nvim_set_hl(0, "Float", { bg = "#232a2d" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#232a2d", fg = "#8ccf7e" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#b3b9b8" })
vim.api.nvim_set_hl(0, "CurrentLineNr", { fg = "#b3b9b8" })
vim.api.nvim_set_hl(0, "Substitute", { fg = "#141b1e", bg = "#e57474" })
vim.api.nvim_set_hl(0, "Search", { fg = "#141b1e", bg = "#e57474" })
vim.api.nvim_set_hl(0, "IncSearch", { fg = "#141b1e", bg = "#e57474" })
