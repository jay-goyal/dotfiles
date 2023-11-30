local status_ok, rainbow_delimiters = pcall(require, "rainbow-delimiters")
if not status_ok then
	return
end

require("rainbow-delimiters.setup").setup({
	strategy = {
		[''] = rainbow_delimiters.strategy['global'],
		vim = rainbow_delimiters.strategy['local'],
	},
	query = {
		[''] = 'rainbow-delimiters',
		lua = 'rainbow-blocks',
	},
	priority = {
		[''] = 110,
		lua = 210,
	},
	highlight = {
		'RainbowDelimiterRed',
		'RainbowDelimiterYellow',
		'RainbowDelimiterBlue',
		'RainbowDelimiterOrange',
		'RainbowDelimiterGreen',
		'RainbowDelimiterViolet',
		'RainbowDelimiterCyan',
	},

})
