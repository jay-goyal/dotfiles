return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        build = function()
            local ts_update =
                require("nvim-treesitter.install").update({ with_sync = false })
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
                    "bash",
                    "cmake",
                    "make",
                    "ninja",
                    "markdown",
                    "hyprlang",
                    "rust",
                },
                auto_install = true,
                sync_install = false,
                highlight = {
                    enable = true, -- false will disable the whole extension
                    disable = { "tmux" }, -- list of language that will be disabled
                    additional_vim_regex_highlighting = false,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<leader>tss",
                        node_incremental = "<leader>tsi",
                        scope_incremental = "<leader>tsc",
                        node_decremental = "<leader>tsd",
                    },
                },
                textobjects = {
                    select = {
                        enable = true,

                        lookahead = true,

                        keymaps = {
                            ["atf"] = "@function.outer",
                            ["itf"] = "@function.inner",
                            ["atc"] = "@call.outer",
                            ["itc"] = "@call.inner",
                            ["atp"] = "@parameter.outer",
                            ["itp"] = "@parameter.inner",
                            ["iti"] = "@conditional.inner",
                            ["ati"] = "@conditional.outer",
                            ["itl"] = "@loop.inner",
                            ["atl"] = "@loop.outer",
                        },
                        include_surrounding_whitespace = true,
                    },
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = {
                            ["]f"] = "@function.outer",
                            ["]c"] = "@class.outer",
                            ["]l"] = "@loop.outer",
                            ["]i"] = "@conditional.outer",
                        },
                        goto_previous_start = {
                            ["[f"] = "@function.outer",
                            ["[c"] = "@class.outer",
                            ["[l"] = "@loop.outer",
                            ["[i"] = "@conditional.outer",
                        },
                    },
                },
            })
        end,
    },
    { "nvim-treesitter/nvim-treesitter-textobjects", branch = "master" },
    {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {
            separator = "─",
        },
    },
}
