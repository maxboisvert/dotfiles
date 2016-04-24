
" plugins: nerdcommenter nerdtree supertab vim-bundler vim-rails
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
let mapleader = '\'
nnoremap <Leader>f :ls<CR>:b<Space>
nnoremap <Leader>a :b#<CR>
nnoremap <Leader>t :NERDTreeToggle<CR>
inoremap {<CR> {<CR>}<Esc>O
" inoremap <expr> <Tab> TabComplete()

fun! Init()
    call InitSessionState()
    call EnableFzf()
    " call SetVexplore()
endfun

" functions

fun! EnableFzf()
    map <C-T> :FZF<CR>
    set rtp+=~/.fzf
endfun

fun! IsSessionFiletype()
    return index(['gitcommit'], &ft) < 0
endfun

fun! TabComplete()
    " inoremap <expr> <Tab> TabComplete()
    if strpart(getline('.'), col('.') - 2, 1) =~ '\w'
        return "\<C-P>"
    else
        return "\<Tab>"
    endif
endfun

fun! InitSessionState()
    if(argc() == 0)
        set ssop=buffers
        let pwdhash = system("echo -n $(pwd | md5)")
        let session_file = $HOME . "/.vim/session/" . pwdhash . ".vim"
        if filereadable(session_file)
            exe "autocmd VimEnter * nested if IsSessionFiletype() | source " . session_file
        endif
        exe "autocmd VimLeave * if IsSessionFiletype() | mksession! " . session_file
    else
        autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | normal! g`"
    endif
endfun

fun! SetVexplore()
    set mouse=a
    let g:netrw_browse_split=4 
    let g:netrw_winsize = 20
    let g:netrw_liststyle=3 
    let g:netrw_banner = 0
    let g:netrw_altv = 1
endfun

call Init()

" disabled

" set complete=.,w,b,u,t,i

" set tags=/tmp/vim/.tags
" command Tags execute ':!ctags -a -f /tmp/vim/.tags -R'

" autocmd FocusLost * silent! wa

