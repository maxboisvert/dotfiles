
" minimal
syntax on
filetype plugin indent on
set backspace=2
set hidden
set autoindent
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" filetypes
au filetype ruby setl shiftwidth=2 tabstop=2 softtabstop=2

" file
set autoread 
set autowriteall
set encoding=utf-8

" ui
set background=dark " light
set noeb vb t_vb=
set guioptions=c
set history=1000 
set lazyredraw
set mouse=

" status
set ruler 
set showmode

" wrapping
set linebreak
set nowrap 

" search
set nohlsearch
set incsearch

" undo
set undolevels=1000 
set undofile 
set undodir=/tmp

" backup
set nobackup 
set nowritebackup 
set noswapfile

" Tags
set tags=/tmp/vim/.tags
command Tags execute ':!ctags -a -f /tmp/vim/.tags -R'

" Cool stuff
au BufEnter * normal! g`"
inoremap {<CR> {<CR>}<Esc>O

" complete
inoremap <expr> <Tab> strpart(getline('.'), col('.') - 2, 1) =~ '\w' ? "\<C-P>" : "\<Tab>"
set complete=.,w,b,u,t,i
set completeopt=

