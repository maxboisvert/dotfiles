
" Vundle - Launch vim and run :PluginInstall
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'cohama/lexima.vim'
call vundle#end()


" vimrc

" minimal
filetype plugin indent on
syntax on

" indent
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2 
set tabstop=2 

" wrap
let &showbreak='↳ '
set breakindent
set linebreak
set wrap 

" misc
set undolevels=1000 
set autoread 
set backspace=2
set complete-=i
set encoding=utf-8
set hidden
set history=1000
set modelines=0

" search
set ignorecase
set incsearch
set nohlsearch
set smartcase
set wildignore+=*/.git/*

" ui
set splitbelow
set background=dark
set completeopt=
set guioptions=c
set laststatus=1
set lazyredraw
set mouse=a
set ruler 
set showmode
set t_vb=
set title
set ttyfast
set visualbell 
set wildmenu

" backup
set nobackup 
set noswapfile
set nowritebackup 

" autocmd
autocmd BufNewFile,BufRead *.vm set syntax=html
autocmd filetype java,python,vim,sh setl shiftwidth=4 tabstop=4 softtabstop=4
autocmd BufEnter * silent! normal! g`"

" mappings
let mapleader = ' '
nnoremap <Leader>s :ls<CR>:b<Space>
nnoremap <Leader>a :b#<CR>
nnoremap <Leader>p :set paste!<CR>
nnoremap <Leader>c :bufdo bd<CR>
nnoremap <Leader>t :split term://bash<CR>

inoremap <expr> <Tab> TabComplete()
map <Enter> :

nnoremap <Leader>r :CtrlPMRU<CR>
nnoremap <Leader>f :CtrlPMixed<CR>
nnoremap <Leader>v :CtrlPLine<CR>


" plugins configuration
let g:lexima_enable_endwise_rules=1

" Vexplorer
let g:netrw_browse_split=4 
let g:netrw_winsize = 20
let g:netrw_liststyle=3 
let g:netrw_banner = 0
let g:netrw_altv = 1

" functions

fun! TabComplete()
	" inoremap <expr> <Tab> strpart(getline('.'), col('.') - 2, 1) =~ '\w' ? "\<C-P>" : "\<Tab>"
	" inoremap <expr> <Tab> TabComplete()
    if strpart(getline('.'), col('.') - 2, 1) =~ '\w'
        return "\<C-P>"
    else
        return "\<Tab>"
    endif
endfun

" disabled
" set tags=/tmp/vim/.tags
" command Tags execute ':!ctags -a -f /tmp/vim/.tags -R'

