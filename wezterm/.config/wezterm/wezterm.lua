local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("FiraCode Nerd Font Mono")
config.harfbuzz_features = { "clig=0", "liga=0" }

config.font_size = 12
config.enable_tab_bar = false

config.colors = {
	foreground = "#c0caf5",
	background = "#1a1b26",
	cursor_bg = "#c0caf5",
	cursor_border = "#c0caf5",
	cursor_fg = "#1a1b26",
	selection_bg = "#283457",
	selection_fg = "#c0caf5",
	split = "#7aa2f7",
	compose_cursor = "#ff9e64",
	scrollbar_thumb = "#292e42",
	ansi = {
		"#15161e",
		"#f7768e",
		"#9ece6a",
		"#e0af68",
		"#7aa2f7",
		"#bb9af7",
		"#7dcfff",
		"#a9b1d6",
	},
	brights = {
		"#414868",
		"#ff899d",
		"#9fe044",
		"#faba4a",
		"#8db0ff",
		"#c7a9ff",
		"#a4daff",
		"#c0caf5",
	},
}

config.window_background_opacity = 0.9
config.enable_wayland = true

return config
