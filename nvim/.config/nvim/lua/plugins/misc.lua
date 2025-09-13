return {
    -- Indentation
    {
        "shellRaining/hlchunk.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            indent = {
                enable = true,
                chars = { "│", "¦", "┆", "┊" },
            },
            line_num = { enable = true, style = "#e0af68" },
        },
    },
    -- Misc
    "tpope/vim-sleuth",
    {
        "tpope/vim-surround",
        dependencies = { "tpope/vim-repeat" },
    },
    "hiphish/rainbow-delimiters.nvim",
}
