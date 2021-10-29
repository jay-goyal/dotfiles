"*************************************************************
" PLUGINS
"*************************************************************
" Plugins using vim-plug
" Install using:
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

call plug#begin('~/.vim/plugged')

" Themeing
Plug 'vim-airline/vim-airline'
Plug 'drewtempelmeyer/palenight.vim'

" Nerd Tree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" Git
Plug 'airblade/vim-gitgutter'

" Misc
Plug 'ap/vim-css-color'     " Color Preview
Plug 'tpope/vim-commentary'      " Comment Toggle
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

"*************************************************************
" SETTINGS
"*************************************************************
" Tab settings
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Line numbers
set nu

" Search stuff
set smartcase
set ignorecase
set nohlsearch
set incsearch

" Misc
set hidden
set noerrorbells
set nowrap
set scrolloff=10
set signcolumn=yes
set splitbelow splitright
set cursorline

" No backup files
set noswapfile
set nobackup
set nowritebackup

" Colorscheme
set termguicolors
let g:onedark_termcolors=256
colorscheme palenight

" Airline settings
let g:airline_theme='palenight'
let g:airline_powerline_fonts = 1

" Nerd Tree
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeGitStatusWithFlags = 1
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

"*************************************************************
" KEYBINDINGS
"*************************************************************
let mapleader = " "

" Life Saver
imap jj <Esc>

" Nerd Tree
nnoremap <leader>f :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>

nnoremap <C-c> "+y
vnoremap <C-c> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

" FZF
nnoremap <A-z> :Files<CR>

" Navigating Splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resizing Splits
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Terminal
nnoremap <leader>tt :new :15sp <Bar> :term<CR>

"*************************************************************
" ALACRITTY STUFF
"*************************************************************
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"

"*************************************************************
" GUI STUFF
"*************************************************************
set guifont=FiraCode\ Nerd\ Font\ Mono:h18 
set mouse=nicr
set mouse=a
let g:neovide_refresh_rate=60
let g:neovide_cursor_animation_length=0.04
