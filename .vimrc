" minimal
syntax on
filetype plugin indent on
set backspace=2

" indent
au filetype ruby setl shiftwidth=2 tabstop=2 softtabstop=2
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set autoindent

" misc
set autoread 
set encoding=utf-8
set hidden
set history=1000 
set nowrap 

" search
set ignorecase
set incsearch
set smartcase

" ui
set background=dark
set completeopt=
set lazyredraw
set ttyfast
set visualbell t_vb=

" backup
set nobackup 
set noswapfile
set nowritebackup 

" Cool stuff
au BufEnter * normal! g`"
inoremap <expr> <Tab> strpart(getline('.'), col('.') - 2, 1) =~ '\w' ? "\<C-P>" : "\<Tab>"
inoremap {<CR> {<CR>}<Esc>O

" fzf
map <C-T> :FZF<CR>
set rtp+=~/.fzf

" disabled

" Vexplore
" let g:netrw_browse_split=4 
" let g:netrw_winsize = 20
" let g:netrw_liststyle=3 
" let g:netrw_banner = 0
" let g:netrw_altv = 1

" set complete=.,w,b,u,t,i
" set mouse=
" set guioptions=c
" set autowriteall
" set ruler 
" set showmode
" set linebreak
" set nohlsearch

" set undolevels=1000 
" set undodir=/tmp
" set undofile 

" set tags=/tmp/vim/.tags
" command Tags execute ':!ctags -a -f /tmp/vim/.tags -R'

