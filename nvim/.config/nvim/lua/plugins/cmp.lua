return {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    opts = {
        keymap = {
            preset = "none",
            ["<C-k>"] = { "select_prev", "fallback" },
            ["<C-j>"] = { "select_next", "fallback" },
            ["<C-b>"] = { "scroll_documentation_up", "fallback" },
            ["<C-f>"] = { "scroll_documentation_down", "fallback" },
            ["<CR>"] = { "accept", "fallback" },
            ["<Tab>"] = { "select_and_accept", "fallback" },
        },
        appearance = {
            nerd_font_variant = "mono",
        },
        completion = {
            documentation = {
                auto_show = true,
                window = { border = "single" },
            },
            menu = {
                border = "single",
                draw = {
                    columns = {
                        { "kind_icon" },
                        { "label", "label_description", gap = 1 },
                        { "kind" },
                    },
                },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" },
            list = { completion = { preset = true, auto_insert = false } },
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
            providers = {
                cmdline = {
                    min_keyword_length = function(ctx)
                        if
                            ctx.mode == "cmdline"
                            and string.find(ctx.line, " ") == nil
                        then
                            return 3
                        end
                        return 0
                    end,
                },
            },
        },
        cmdline = {
            keymap = {
                preset = "inherit",
                ["<CR>"] = {},
            },
            completion = {
                menu = { auto_show = true },
                list = { selection = { auto_insert = true } },
            },
        },
        opts_extend = { "sources.default" },
    },
}
