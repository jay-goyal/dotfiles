local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt
color = color or "catppuccin"

options = {
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
  wrap = false,
  scrolloff = 10,
  signcolumn = "yes",
  cursorline = true,
  termguicolors = true,
  scrolloff = 8,
  updatetime = 50,
}

for k,v in pairs(options) do
    opt[k] = v
end

cmd.colorscheme(color)
opt.isfname:append("@-@")
