" curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin()
Plug 'terrortylor/nvim-comment'
Plug 'Darazaki/indent-o-matic'
call plug#end()

lua << EOF
require('nvim_comment').setup {}
require('indent-o-matic').setup {}
EOF

autocmd BufReadPost * silent! normal! g`"
colorscheme default
let g:is_bash = 1

set background=dark
set clipboard=unnamedplus
set ignorecase smartcase
set breakindent linebreak wrap
set list listchars=tab:\ \ ,trail:·
set tabstop=4 shiftwidth=4

noremap ; :
nnoremap <Backspace> <C-O>

nnoremap j gj
nnoremap k gk
