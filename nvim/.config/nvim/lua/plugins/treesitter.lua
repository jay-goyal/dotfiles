return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        local ts_update =
            require("nvim-treesitter.install").update({ with_sync = true })
        ts_update()
    end,
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = {
                "python",
                "c",
                "cpp",
                "css",
                "json",
                "yaml",
                "toml",
                "rust",
                "bash",
                "cmake",
                "make",
                "ninja",
                "markdown",
                "hyprlang",
                -- "haskell",
            },
            auto_install = true,
            sync_install = false,
            ignore_install = { "" }, -- List of parsers to ignore installing
            highlight = {
                enable = true, -- false will disable the whole extension
                disable = { "" }, -- list of language that will be disabled
                additional_vim_regex_highlighting = true,
            },
            indent = { enable = true, disable = { "yaml" } },
            autotag = {
                enable = true,
            },
        })
    end,
}
