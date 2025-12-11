return {
    -- Indentation
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },
    -- Undotree
    {
        "jiaoshijie/undotree",
        opts = {
            window = { border = "single", winblend = 0 },
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
