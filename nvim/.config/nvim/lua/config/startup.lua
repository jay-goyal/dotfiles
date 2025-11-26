local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

local options = {
    -- Indents
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    smartindent = true,

    -- Line Numbers
    number = true,
    relativenumber = true,

    -- Search
    smartcase = true,
    ignorecase = true,
    hlsearch = false,
    incsearch = true,

    -- Splits
    splitbelow = true,
    splitright = true,

    -- Misc
    hidden = true,
    errorbells = false,
    wrap = true,
    signcolumn = "yes",
    cursorline = true,
    termguicolors = true,
    scrolloff = 15,
    updatetime = 50,
}

local globals = {}

for k, v in pairs(options) do
    opt[k] = v
end

for k, v in pairs(globals) do
    g[k] = v
end

opt.isfname:append("@-@")
opt.nrformats:append("octal")
opt.nrformats:append("alpha")

vim.api.nvim_set_option_value("quickfixtextfunc", "v:lua.QuickfixFormat", {})

function _G.QuickfixFormat(info)
    local items = vim.fn.getqflist({ id = info.id, items = 1 }).items
    local lines = {}
    local max_path_width = 50 -- Set your desired max width

    local max_lnum = 0
    for i = info.start_idx, info.end_idx do
        local item = items[i]
        max_lnum = math.max(max_lnum, #tostring(item.lnum))
    end

    for i = info.start_idx, info.end_idx do
        local item = items[i]
        local fname = vim.fn.fnamemodify(vim.fn.bufname(item.bufnr), ":.")

        -- Truncate with ellipsis if too long
        if #fname > max_path_width then
            fname = "..." .. fname:sub(-(max_path_width - 3))
        end

        local lnum = item.lnum
        local col = item.col
        local text = item.text:gsub("^%s+", "")

        local line = string.format(
            "%-" .. max_path_width .. "s  |%" .. max_lnum .. "d:%-3d| %s",
            fname,
            lnum,
            col,
            text
        )
        table.insert(lines, line)
    end

    return lines
end
