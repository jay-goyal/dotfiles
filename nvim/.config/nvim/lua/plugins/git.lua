return {
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "▎" },
            },
            signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
            numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir = {
                interval = 1000,
                follow_files = true,
            },
            attach_to_untracked = true,
            current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
            },
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil, -- Use default
            max_file_length = 40000,
            preview_config = {
                -- Options passed to nvim_open_win
                border = "single",
                style = "minimal",
                relative = "cursor",
                row = 0,
                col = 1,
            },
        },
        keys = {
            { "<leader>vb", mode = { "n" }, "<cmd>Gitsigns blame_line<cr>" },
            { "<leader>vhh", mode = { "n" }, "<cmd>Gitsigns preview_hunk<cr>" },
            { "<leader>vhp", mode = { "n" }, "<cmd>Gitsigns next_hunk<cr>" },
            { "<leader>vhn", mode = { "n" }, "<cmd>Gitsigns prev_hunk<cr>" },
            { "<leader>vhs", mode = { "n" }, "<cmd>Gitsigns stage_hunk<cr>" },
            { "<leader>vhr", mode = { "n" }, "<cmd>Gitsigns reset_hunk<cr>" },
        },
        lazy = false,
    },
    {
        "tpope/vim-fugitive",
        keys = {
            { "<leader>vs", mode = { "n" }, "<cmd>Git stat<cr>" },
            { "<leader>vcc", mode = { "n" }, "<cmd>Git commit<cr>" },
            { "<leader>vca", mode = { "n" }, "<cmd>Git commit --amend<cr>" },
            { "<leader>va", mode = { "n" }, "<cmd>Git add .<cr>" },
            { "<leader>vp", mode = { "n" }, "<cmd>Git push<cr>" },
        },
        lazy = false,
    },
}
