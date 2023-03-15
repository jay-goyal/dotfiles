local home_dir = os.getenv("HOME")
package.path = home_dir .. "/.config/nvim/after/plugin/?.lua;" .. package.path

require("plugins.packer")
require("config.startup")
require("config.keymap")
require("config.neovide")
require("lsp-config")
