return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<leader>ff", mode = { "n" }, "<cmd>FzfLua files<CR>" },
        { "<leader>fg", mode = { "n" }, "<cmd>FzfLua git_files<CR>" },
        { "<leader>fr", mode = { "n" }, "<cmd>FzfLua live_grep<CR>" },
        { "<leader>fb", mode = { "n" }, "<cmd>FzfLua buffers<CR>" },
        { "<leader>fR", mode = { "n" }, "<cmd>FzfLua registers<CR>" },
        { "<leader>fm", mode = { "n" }, "<cmd>FzfLua marks<CR>" },
        { "<leader>f/", mode = { "n" }, "<cmd>FzfLua grep_curbuf<CR>" },
        { "<leader>fh", mode = { "n" }, "<cmd>FzfLua helptags<CR>" },
    },
    opts = {
        winopts = {
            height = 0.80,
            width = 0.87,
            row = 0.3,
            col = 0.5,
            border = "single",
            preview = {
                vertical = "up:60%", -- Preview placement
                layout = "horizontal",
                border = "single",
                flip_columns = 120,
            },
        },
        keymap = {
            fzf = {
                ["ctrl-q"] = "select-all+accept",
            },
        },
        files = {
            prompt = "  ",
            cwd_prompt = false,
            hidden = true, -- Show hidden files
            ignore_current_buffer = true,
            follow = true, -- Follow symlinks
            cmd = "fd --hidden --follow --no-ignore --exclude '.git' --exclude '.cache' --exclude '.rustup' --exclude '.pyenv' --exclude '.npm'",
        },
        grep = {
            hidden = true,
            prompt = "Grep   ",
            exec_empty_query = true,
            rg_glob = true,
            rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -g '!.git' -e",
        },
        git = {
            files = {
                prompt = "Git Files   ",
            },
            status = {
                prompt = "Git Status   ",
            },
        },
        registers = {
            prompt = "Registers   ",
        },
        manpages = {
            prompt = "Man Pages   ",
            sections = { "ALL" },
        },
    },
    lazy = false,
}
