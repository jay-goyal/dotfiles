local opt = vim.opt
local g = vim.g
if g.neovide then
  opt.guifont = "FiraCode Nerd Font Mono:h11"
  opt.mouse = "nicr"
  opt.mouse = "a"
  g.neovide_refresh_rate = 60
  g.neovide_cursor_animation_length = 0.03
  g.neovide_padding_top = 10
  g.neovide_padding_bottom = 10
  g.neovide_padding_right = 10
  g.neovide_padding_left = 10
end
