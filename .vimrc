" Load tags-file recursively
set tags=./tags;/

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif


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

" Airline - disable if we have Syntastic
let g:airline#extensions#tabline#enabled = 0
"set laststatus=2
"set ttimeoutlen=50

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

function LinuxStyle()
    syn keyword cOperator likely unlikely
    syn keyword cType u8 u16 u32 u64 s8 s16 s32 s64setlocal tabstop=8

    setlocal shiftwidth=8
    setlocal softtabstop=8
    setlocal textwidth=80
    setlocal noexpandtab

    setlocal cindent
    setlocal formatoptions=tcqlron
    setlocal cinoptions=:0,l1,t0,g0,(0
endfunction

" Highlight whitespace
set listchars=tab:▸\ ,eol:¬
set list

" Color matching parenthesis as bold white
:hi MatchParen cterm=bold ctermbg=none ctermfg=white

" Show line numbers
set number

" Hanging function arguments
set cino=(0
