local home_dir = os.getenv("HOME")
package.path = home_dir .. "/.config/nvim/after/plugin/?.lua;" .. package.path
require("config.startup")
require("config.keymap")
require("plugins.lazy")
require("lsp-config")
