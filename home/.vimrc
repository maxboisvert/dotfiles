
" Vundle - Launch vim and run :PluginInstall
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'cohama/lexima.vim'
Plugin 'vim-scripts/gitignore'
call vundle#end()

" best vimrc
filetype plugin indent on
syntax on

" indent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set autoindent
set expandtab

" wrap
let &showbreak='↳ '
set breakindent
set linebreak
set wrap

" search
set ignorecase
set incsearch
set nohlsearch
set smartcase

" backup
set nobackup
set noswapfile
set nowritebackup

" misc
set undolevels=1000
set autoread
set backspace=2
set encoding=utf-8
set hidden
set history=1000
set clipboard+=unnamedplus

" ui
let mapleader = ' '
" set foldcolumn=2
set number
set scrolloff=5
set splitbelow
set background=dark
set completeopt=
set laststatus=2
set lazyredraw
set mouse=a
set ruler
set showmode
set visualbell
set cursorline
set ttyfast
set t_vb=
set wildmenu

if has('nvim')
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

inoremap <expr> <Tab> strpart(getline('.'), col('.') - 2, 1) =~ '\w' ? "\<C-P>" : "\<Tab>"
map <Enter> :
nnoremap <Leader>c :bufdo bd<CR>
nnoremap <Leader>p :CtrlPMRUFiles<CR>
nnoremap <Leader>o :CtrlP<CR>
nnoremap j gj
nnoremap k gk
nnoremap <Leader>t :split term://bash<CR>

" autocmd
autocmd filetype java,python,vim,sh setl shiftwidth=4 tabstop=4 softtabstop=4
autocmd BufEnter * silent! normal! g`"
autocmd BufNewFile,BufRead Gemfile,Vagrantfile,Guardfile set filetype=ruby
autocmd VimEnter * WildignoreFromGitignore

" colorscheme ron

highlight ExtraWhitespace ctermbg=red guibg=red
highlight CursorLine cterm=None ctermbg=236 guibg=#333333
highlight LineNr ctermfg=239 guifg=#454545
highlight CursorLineNR ctermfg=243 guifg=#666666
" highlight FoldColumn ctermbg=235 guibg=#181818

match ExtraWhitespace /\s\+\%#\@<!$/

" Tags
let dirhash=system('pwd | md5 | xargs echo -n')
let tagsfile="/tmp/.vim-tags-" . dirhash
let &tags=tagsfile
command Tags execute ':!ctags -R --exclude=*/vendor/* --exclude=*/node_modules/* --exclude=*.js -f ' . tagsfile

" rails
command Rspec :term bundle exec rspec --fail-fast --format progress
command RspecCurrentFile :term bundle exec rspec --fail-fast --format progress %
command Rubocup :term bundle exec rubocop

" git
command GitStatus :term git status
command GitLog :term git log
command GitDiff :term git diff
command GitCommit :term commit
command GitPushPr :term git_force_push_current
command GitAmend :term git_amend

" Vexplore
let g:netrw_browse_split=4
let g:netrw_winsize = 20
let g:netrw_liststyle=3
let g:netrw_banner = 0
let g:netrw_altv = 1

" ctrlp (F5 to clear cache)
let g:ctrlp_mruf_exclude = '.*/tmp/.*\|.*/.git/.*'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 200000
let g:ctrlp_mruf_relative = 1
" let g:ctrlp_compare_lim = 0

" lexima
let g:lexima_enable_endwise_rules = 1

