
" plugins: nerdcommenter nerdtree supertab vim-bundler vim-rails ctrlp
execute pathogen#infect()

" minimal
syntax on
filetype plugin indent on

" indent
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set autoindent

" misc
set autoread 
set autowrite
set autowriteall
set backspace=2
set encoding=utf-8
set hidden
set history=1000 
set linebreak
set nowrap 
set modelines=0

" search
set ignorecase
set incsearch
set nohlsearch
set smartcase

" ui
set background=dark
set completeopt=
set guioptions=c
set lazyredraw
set mouse=a
set ruler 
set showmode
set ttyfast
set visualbell t_vb=

" backup
set nobackup 
set noswapfile
set nowritebackup 

" undo
set undodir=/tmp
set undofile 
set undolevels=1000 

" autocmd
autocmd BufNewFile,BufRead *.vm set syntax=html
autocmd filetype java,python,vim setl shiftwidth=4 tabstop=4 softtabstop=4

" map
let mapleader = ';'
nnoremap <Leader>r :ls<CR>:b<Space>
nnoremap <Leader>a :b#<CR>
nnoremap <Leader>t :NERDTreeToggle<CR>
nnoremap <Leader>f :CtrlPMixed<CR>
inoremap {<CR> {<CR>}<Esc>O

" disabled

" set complete=.,w,b,u,t,i

" set tags=/tmp/vim/.tags
" command Tags execute ':!ctags -a -f /tmp/vim/.tags -R'

" autocmd FocusLost * silent! wa

