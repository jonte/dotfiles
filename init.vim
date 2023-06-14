call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'shannonmoeller/vim-monokai256'
Plug 'bling/vim-airline'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rust-lang/rust.vim'
Plug 'junegunn/fzf'
Plug 'kergoth/vim-bitbake'
Plug 'mfussenegger/nvim-lint'

call plug#end()

lua << EOF
if vim.fn.executable('oelint-adv') == 1 then
	require('lint').linters_by_ft.bitbake = {'oelint-adv',}
end

if vim.fn.executable('shellcheck') == 1 then
	require('lint').linters_by_ft.sh = {'shellcheck',}
end

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
EOF

colorscheme monokai256
set mouse=a
set hlsearch
set incsearch
map tj :tabprev<cr>
map tk :tabnext<cr>
set number
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
