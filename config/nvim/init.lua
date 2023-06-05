local home_dir = os.getenv("HOME")
package.path = home_dir .. "/.config/nvim/after/plugin/?.lua;" .. package.path

--[[ local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" ]]
--[[ if not vim.loop.fs_stat(lazypath) then ]]
--[[     vim.fn.system({ ]]
--[[         "git", ]]
--[[         "clone", ]]
--[[         "--filter=blob:none", ]]
--[[         "https://github.com/folke/lazy.nvim.git", ]]
--[[         "--branch=stable", -- latest stable release ]]
--[[         lazypath, ]]
--[[     }) ]]
--[[ end ]]
--[[ vim.opt.rtp:prepend(lazypath) ]]

require("plugins.packer")
require("config.startup")
require("config.keymap")
require("lsp-config")
