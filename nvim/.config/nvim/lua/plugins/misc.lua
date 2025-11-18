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
            line_num = { enable = true, style = "#FF9E64" },
        },
    },

    -- Undotree
    {
        "jiaoshijie/undotree",
        opts = {
            window = { border = "single" },
        },
        keys = { -- load the plugin only when using it's keybinding:
            { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
        },
    },
    -- Misc
    "tpope/vim-sleuth",
    {
        "tpope/vim-surround",
        dependencies = { "tpope/vim-repeat" },
    },
    "hiphish/rainbow-delimiters.nvim",
    "tpope/vim-repeat",
}
