return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night",
    transparent = true,
    on_colors = function(colors)
      colors.border = "#7aa2f7"
    end,
  },
  on_highlights = function(hl, colors)
    hl.WinBar = { bg = "NONE", fg = colors.fg }
    hl.WinBarNC = { bg = "NONE", fg = colors.fg_dark }
  end,
}
