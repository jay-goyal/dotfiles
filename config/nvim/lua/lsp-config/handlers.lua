local _, rt = pcall(require, "rust-tools")

local border = {
    { "╭", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╮", "FloatBorder" },
    { "│", "FloatBorder" },
    { "╯", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╰", "FloatBorder" },
    { "│", "FloatBorder" },
}

local M = {}

M.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn",  text = "" },
        { name = "DiagnosticSignHint",  text = "" },
        { name = "DiagnosticSignInfo",  text = "" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end


    local config = {
        virtual_text = false,
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
end

local function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.documentHighlight then
        vim.api.nvim_exec(
            [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
            false
        )
    end
end


keymap(
    "n",
    "<leader>gN",
    function()
        vim.diagnostic.goto_prev({ border = "rounded" })
    end,
    opts
)
keymap(
    "n",
    "<leader>gl",
    vim.diagnostic.open_float,
    opts
)
keymap(
    "n",
    "<leader>gqn",
    function()
        vim.diagnostic.goto_next({ border = "rounded" })
    end,
    opts
)
keymap(
    "n",
    "<leader>gqq",
    vim.diagnostic.setloclist,
    opts
)

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts_local = { buffer = ev.buf }
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        keymap(
            "n",
            "<leader>gD",
            vim.lsp.buf.declaration,
            opts_local
        )
        keymap(
            "n",
            "<leader>gd",
            vim.lsp.buf.definition,
            opts_local
        )
        keymap(
            "n",
            "<leader>gk",
            vim.lsp.buf.hover,
            opts_local
        )
        -- keymap(bufnr, "n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts_local)
        --[[ keymap( ]]
        --[[ 	bufnr, ]]
        --[[ 	"n", ]]
        --[[ 	"<leader>gk", ]]
        --[[ 	":lua vim.lsp.buf.signature_help()<CR>", ]]
        --[[ 	opts_local ]]
        --[[ ) ]]
        keymap(
            "n",
            "<leader>gr",
            vim.lsp.buf.rename,
            opts_local
        )
        -- keymap(bufnr, "n", "gr", ":lua vim.lsp.buf.references()<CR>", opts_local)
        -- keymap(bufnr, "n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts_local)
        -- keymap(bufnr, "n", "<leader>f", ":lua vim.diagnostic.open_float()<CR>", opts_local)
        keymap("n", "<leader>gf", vim.lsp.buf.format, opts_local)
    end
})

M.on_attach = function(client, bufnr)
    if client.name == "tsserver" then
        client.server_capabilities.documentFormattingProvider = false
    end


    lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
