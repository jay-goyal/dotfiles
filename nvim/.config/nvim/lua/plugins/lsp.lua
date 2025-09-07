return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "asm_lsp", -- ASM
            "clangd", -- C/C++
            -- "hls", -- Haskell
            "lua_ls", -- Lua
            "jedi_language_server", -- Python
            "gopls", -- Go
            "bashls", -- Shell
        },
    },
    dependencies = {
        {
            "mason-org/mason.nvim",
            opts = {
                ui = {
                    border = "single",
                },
                log_level = vim.log.levels.INFO,
                max_concurrent_installers = 6,
            },
        },
        {
            "neovim/nvim-lspconfig",
            dependencies = { "SmiteshP/nvim-navic", "saghen/blink.cmp" },
            config = function()
                local signs = {
                    { name = "DiagnosticSignError", text = "" },
                    { name = "DiagnosticSignWarn", text = "" },
                    { name = "DiagnosticSignHint", text = "" },
                    { name = "DiagnosticSignInfo", text = "" },
                }

                for _, sign in ipairs(signs) do
                    vim.fn.sign_define(
                        sign.name,
                        { texthl = sign.name, text = sign.text, numhl = "" }
                    )
                end

                local config = {
                    virtual_text = false,
                    virtual_lines = {
                        current_line = true,
                    },
                    signs = {
                        active = signs,
                    },
                    update_in_insert = true,
                    underline = true,
                    severity_sort = true,
                    float = {
                        focusable = true,
                        style = "minimal",
                        border = "single",
                        source = "always",
                        header = "",
                        prefix = "",
                    },
                }

                vim.diagnostic.config(config)

                local capabilities = vim.lsp.protocol.make_client_capabilities()
                capabilities =
                    require("blink.cmp").get_lsp_capabilities(capabilities)
                vim.lsp.config("*", { capabilities = capabilities })

                vim.api.nvim_create_autocmd("LspAttach", {
                    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                    callback = function(args)
                        keymap("n", "<leader>gl", function()
                            vim.diagnostic.open_float({ border = "single" })
                        end, opts)
                        keymap("n", "<leader>gD", vim.lsp.buf.declaration, opts)
                        keymap("n", "<leader>gd", vim.lsp.buf.definition, opts)
                        keymap("n", "<leader>gk", function()
                            vim.lsp.buf.hover({ border = "single" })
                        end, opts)
                        keymap("n", "<leader>gr", vim.lsp.buf.references, opts)
                        keymap("n", "<leader>gR", vim.lsp.buf.rename, opts)
                        keymap(
                            "n",
                            "<leader>gca",
                            vim.lsp.buf.code_action,
                            opts
                        )

                        local navic = require("nvim-navic")
                        local bufnr = args.buf
                        local client =
                            vim.lsp.get_client_by_id(args.data.client_id)

                        if not vim.b[bufnr].navic_attached then
                            if
                                client.server_capabilities.documentSymbolProvider
                            then
                                navic.attach(client, bufnr)
                                vim.o.winbar =
                                    "%{%v:lua.require'nvim-navic'.get_location()%}"
                                vim.b[bufnr].navic_attached = true
                            else
                                vim.o.winbar = ""
                            end
                        end
                    end,
                })
            end,
        },
    },
}
