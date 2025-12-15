return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        style = "night",
        on_highlights = function(hl, colors)
            hl.FloatBorder = { bg = colors.bg_dark, fg = colors.blue }
            hl.NormalFloatBorder = { bg = colors.bg_dark, fg = colors.blue }
            hl.FzfLuaBorder = { bg = colors.bg_dark, fg = colors.blue }
            hl.TreesitterContext = { bg = colors.bg_dark }
            hl.TreesitterContextSeparator =
                { fg = colors.orange, bg = colors.bg_dark }
            hl.WinSeparator = { fg = colors.blue }
        end,
    },
}
