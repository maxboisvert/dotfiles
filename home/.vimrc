
" minimal
syntax on
filetype plugin indent on

" indent
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
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
set mouse=
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
autocmd filetype ruby setl shiftwidth=2 tabstop=2 softtabstop=2
" autocmd FocusLost * silent! wa

" map
let mapleader = '\'
inoremap <expr> <Tab> strpart(getline('.'), col('.') - 2, 1) =~ '\w' ? "\<C-P>" : "\<Tab>"
nnoremap <Leader>f :ls<CR>:b<Space>
inoremap {<CR> {<CR>}<Esc>O

" comment
map <Leader># :s/^/#/<CR>


" fzf
map <C-T> :FZF<CR>
set rtp+=~/.fzf

" Session
set ssop=buffers
if(argc() == 0)
    autocmd VimEnter * nested :source ~/.session.vim
else
    autocmd BufEnter * normal! g`"
endif
autocmd VimLeave * :mksession! ~/.session.vim

" disabled

" Vexplore
" let g:netrw_browse_split=4 
" let g:netrw_winsize = 20
" let g:netrw_liststyle=3 
" let g:netrw_banner = 0
" let g:netrw_altv = 1

" set complete=.,w,b,u,t,i

" set tags=/tmp/vim/.tags
" command Tags execute ':!ctags -a -f /tmp/vim/.tags -R'

