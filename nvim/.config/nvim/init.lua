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
vim.cmd.colorscheme("tokyonight")
vim.cmd("highlight! clear WinBar")
vim.cmd("highlight! clear WinBarNC")
