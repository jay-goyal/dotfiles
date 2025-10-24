return {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000,
    name = "everforest",
    opts = {
        background = "hard",
        ui_contrast = "high",
        float_style = "dim",

        on_highlights = function(hl, colors)
            hl.WinBar = { bg = colors.none, fg = colors.fg }
            hl.WinBarNC = { bg = colors.none, fg = colors.fg }
        end,
    },
}
