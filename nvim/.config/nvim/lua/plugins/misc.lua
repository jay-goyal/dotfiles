return {
    -- Indentation
    {
        "shellRaining/hlchunk.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            indent = {
                enable = true,
                chars = { "│", "¦", "┆", "┊" },
                style = "#404749",
            },
            line_num = { enable = true, style = "#e5c76b" },
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
