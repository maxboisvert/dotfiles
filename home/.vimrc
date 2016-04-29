
" Vundle - Launch vim and run :PluginInstall
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'tpope/vim-endwise'
Plugin 'cohama/lexima.vim'
Plugin 'vim-scripts/mru.vim'
" Plugin 'monokrome/buffersweeper.vim'
call vundle#end()


" vimrc

" minimal
filetype plugin indent on
syntax on

" indent
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set autoindent

" wrap
set linebreak
set wrap 
set breakindent
let &showbreak='↳ '

" misc
set autoread 
set backspace=2
set encoding=utf-8
set hidden
set history=1000
set modelines=0

" search
set ignorecase
set incsearch
set nohlsearch
set smartcase

" ui
set title
set background=dark
set completeopt=
set guioptions=c
set lazyredraw
set mouse=a
set ruler 
set showmode
set ttyfast
set visualbell t_vb=
set wildmenu

" backup
set nobackup 
set noswapfile
set nowritebackup 

" undo
" set undodir=/tmp
" set undofile 
set undolevels=1000 

" autocmd
autocmd BufNewFile,BufRead *.vm set syntax=html
autocmd filetype java,python,vim,sh setl shiftwidth=4 tabstop=4 softtabstop=4
autocmd BufEnter * silent! normal! g`"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd bufenter * if winnr("$") == 1 && bufname('') == '__MRU_Files__' | q | endif

" leader map
let mapleader = ';'
" nnoremap <Leader>s :ls<CR>:b<Space>
nnoremap <Leader>a :b#<CR>
nnoremap <Leader>p :set paste!<CR>
" nnoremap <Leader>c :bufdo bd<CR>
" nnoremap <Leader>f :MRU<CR>
nnoremap <Leader>t :NERDTreeToggle<CR>
" nnoremap <Leader>b :bro ol<CR>q
" nnoremap <Leader>f :CtrlPMixed<CR>
nnoremap <Leader>r :CtrlPMRU<CR>
nnoremap <Leader>f :CtrlPMixed<CR>
nnoremap <Leader>v :CtrlPLine<CR>

" plugins configuration
" let g:NERDTreeMouseMode=3
let g:lexima_enable_endwise_rules=1
let MRU_Auto_Close = 0
let MRU_Exclude_Files = '/\.git/\|/tmp/'
" let MRU_Window_Height = 10
" let g:NERDTreeWinSize=22

" functions

" fun! Init()
    " call SetVexplore()
" endfun

fun! TabComplete()
	" inoremap <expr> <Tab> strpart(getline('.'), col('.') - 2, 1) =~ '\w' ? "\<C-P>" : "\<Tab>"
    if strpart(getline('.'), col('.') - 2, 1) =~ '\w'
        return "\<C-P>"
    else
        return "\<Tab>"
    endif
endfun

fun! SetVexplore()
    " nnoremap <Leader>v :Vexplore .<CR>
    set mouse=a
    let g:netrw_browse_split=4 
    let g:netrw_winsize = 20
    let g:netrw_liststyle=3 
    let g:netrw_banner = 0
    let g:netrw_altv = 1
endfun

function! CloseHiddenBuffers()
	let i = 0
	let n = bufnr('$')
	while i < n
		let i = i + 1
		if bufloaded(i) && bufwinnr(i) < 0 && getbufvar(i, '&modified') == 0
			exe 'bd ' . i
		endif
	endwhile
endfun

" call Init()

" disabled
" set tags=/tmp/vim/.tags
" command Tags execute ':!ctags -a -f /tmp/vim/.tags -R'

