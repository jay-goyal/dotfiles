local opt = vim.opt
local g = vim.g
if vim.g.neovide then
    opt.guifont = "FiraCode Nerd Font Mono:h12"
    opt.mouse = "nicr"
    opt.mouse = "a"
    g.neovide_refresh_rate = 60
    g.neovide_cursor_animation_length = 0.03
end
