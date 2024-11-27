vim.cmd([[
    augroup _catppuccin
        autocmd!
        autocmd VimEnter * :CatppuccinCompile
    augroup end
]])
