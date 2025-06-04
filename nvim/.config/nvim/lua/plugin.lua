local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
    return
end

lazy.setup({
    ui = { border = "rounded" },
    install = { colorscheme = { "tokyonight" } },
    spec = { import = "plugins" },
})
