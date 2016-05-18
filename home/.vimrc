
" Vundle - Launch vim and run :PluginInstall
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'cohama/lexima.vim'
call vundle#end()

" vimrc

" minimal
filetype plugin indent on
syntax on

let dirhash=system('pwd | md5 | xargs echo -n')

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
set wildignore+=*/.git/*,*/vendor/*,*/node_modules/*,*.log,*/tmp/*,*.zip,*.swp,*.bak,*.pyc,*.class

" ui
set scrolloff=5
set splitbelow
set background=dark
set completeopt=
set guioptions=c
set laststatus=2
set lazyredraw
set mouse=a
set ruler
set showmode
set t_vb=
set ttyfast
set visualbell
set wildmenu

" backup
set nobackup
set noswapfile
set nowritebackup

if has('nvim')
    " set termguicolors
    " let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" tags
let tagsfile="/tmp/.vim-tags-" . dirhash
let &tags=tagsfile
command Tags execute ':!ctags -R --exclude=*/vendor/* --exclude=*/node_modules/* --exclude=*.js -f ' . tagsfile

" autocmd
autocmd BufNewFile,BufRead *.vm set syntax=html
autocmd filetype java,python,vim,sh setl shiftwidth=4 tabstop=4 softtabstop=4
autocmd BufEnter * silent! normal! g`"
autocmd BufNewFile,BufRead Gemfile,Vagrantfile,Guardfile set filetype=ruby

" highlight whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" mappings
let mapleader = ' '
nnoremap <Leader>h :b#<CR>

nnoremap <Leader>s :ls<CR>:b<Space>
nnoremap <Leader>p :set paste!<CR>
nnoremap <Leader>c :bufdo bd<CR>
nnoremap <Leader>t :split term://bash<CR>

nnoremap <Leader>f :CtrlPMRU<CR>
nnoremap <Leader>v :CtrlPMixed<CR>
nnoremap <Leader>r :CtrlPLine<CR>
nnoremap <Leader>j :CtrlPBufTagAll<CR>

inoremap <expr> <Tab> TabComplete()
map <Enter> :
nnoremap j gj
nnoremap k gk

" rails
command Rspec :term bundle exec rspec --fail-fast
command RspecCurrentFile :term bundle exec rspec --fail-fast %
command Rubocup :term bundle exec rubocop

" git
command GitStatus :term git status
command GitLog :term git log
command GitDiff :term git diff
command GitCommit :term commit
command GitPushPr :term git_force_push_current
command GitAmend :term git_amend

" plugins configuration
let g:lexima_enable_endwise_rules = 1

let g:ctrlp_max_files = 200000
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_mruf_relative = 1
let g:ctrlp_mruf_exclude = '.*/tmp/.*\|.*/.git/.*'

" Vexplorer
let g:netrw_browse_split=4
let g:netrw_winsize = 20
let g:netrw_liststyle=3
let g:netrw_banner = 0
let g:netrw_altv = 1

" functions

fun! TabComplete()
    if strpart(getline('.'), col('.') - 2, 1) =~ '\w'
        return "\<C-P>"
    else
        return "\<Tab>"
    endif
endfun

