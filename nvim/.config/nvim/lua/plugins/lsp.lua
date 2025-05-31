return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "lua_ls",
      "jsonls",
      "clangd",
      "jedi_language_server",
      "asm_lsp",
      "rust_analyzer",
      "ruff",
    },
  },
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {
        ui = {
          border = "rounded",
        },
        log_level = vim.log.levels.INFO,
        max_concurrent_installers = 6,
      },
    },
    {
      "neovim/nvim-lspconfig",
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
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
          },
        }

        vim.diagnostic.config(config)

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities =
          require("cmp_nvim_lsp").default_capabilities(capabilities)
        vim.lsp.config("*", { capabilities = capabilities })

        vim.api.nvim_create_autocmd("LspAttach", {
          group = vim.api.nvim_create_augroup("UserLspConfig", {}),
          callback = function()
            keymap("n", "<leader>gl", function()
              vim.diagnostic.open_float({ border = "rounded" })
            end, opts)
            keymap("n", "<leader>gD", vim.lsp.buf.declaration, opts)
            keymap("n", "<leader>gd", vim.lsp.buf.definition, opts)
            keymap("n", "<leader>gk", function()
              vim.lsp.buf.hover({ border = "rounded" })
            end, opts)
            keymap("n", "<leader>gr", vim.lsp.buf.references, opts)
            keymap("n", "<leader>gR", vim.lsp.buf.rename, opts)
            keymap("n", "<leader>gca", vim.lsp.buf.code_action, opts)
          end,
        })
      end,
    },
  },
}
