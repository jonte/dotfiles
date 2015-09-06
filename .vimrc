" Load tags-file recursively
set tags=./tags;/

" For bandling background color issues in tmux
set t_ut=

" Support for cool color schemes
set t_Co=256
colors molokai

set mouse=a
syntax enable
execute pathogen#infect()
filetype plugin indent on
set incsearch
set hlsearch

" Airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
set ttimeoutlen=50

" ctag navigation
map gD :vsplit<cr>:tag <c-r><c-w><cr>

" Tab navigation
map tj :tabprev<cr>
map tk :tabnext<cr>

" Tab settings
set expandtab
set shiftwidth=4
set softtabstop=4

" Highlight col 80
set colorcolumn=80
