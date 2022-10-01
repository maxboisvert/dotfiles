" curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin()
Plug 'terrortylor/nvim-comment'
Plug 'Darazaki/indent-o-matic'
call plug#end()

lua << EOF
require('nvim_comment').setup {}
require('indent-o-matic').setup {}
EOF

augroup vimrc
    autocmd!
    autocmd BufNewFile,BufRead Gemfile,Guardfile set filetype=ruby
    autocmd BufReadPost * silent! normal! g`"
augroup END

colorscheme default
let g:is_bash = 1
let g:mapleader = ' '

set background=dark
set clipboard=unnamedplus
set lazyredraw
set ignorecase smartcase
set breakindent linebreak wrap
set list listchars=tab:\ \ ,trail:·
set tabstop=4 shiftwidth=4

noremap ; :
nnoremap <Backspace> <C-O>
nnoremap <Leader>[ :let @+ = expand("%")<CR>

nnoremap j gj
nnoremap k gk
