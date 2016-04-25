
" Vundle - Launch vim and run :PluginInstall
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-endwise'
call vundle#end()


" vimrc

" minimal
filetype plugin indent on
syntax on

" indent
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set autoindent

" misc
set autoread 
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
autocmd filetype java,python,vim,sh setl shiftwidth=4 tabstop=4 softtabstop=4
autocmd BufEnter * silent! normal! g`"

" map
let mapleader = ';'
nnoremap <Leader>s :ls<CR>:b<Space>
nnoremap <Leader>a :b#<CR>
nnoremap <Leader>t :NERDTreeToggle<CR>
nnoremap <Leader>f :CtrlPMixed<CR>
nnoremap <Leader>r :CtrlPMRU<CR>
" inoremap {<CR> {<CR>}<Esc>O

" plugins config
let g:NERDTreeMouseMode=3

" disabled
" set tags=/tmp/vim/.tags
" command Tags execute ':!ctags -a -f /tmp/vim/.tags -R'
