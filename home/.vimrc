
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

" TODO
" check compiled with for options categories

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

" statusline
set laststatus=2
set ruler
set showmode
set wildmenu

" buffer
set autoread
set hidden
set encoding=utf-8

" state
set undolevels=1000
set history=1000
set clipboard+=unnamedplus

" behavior
let mapleader = ' '
set backspace=2
set scrolloff=5
set splitbelow
set completeopt=
set mouse=a

" theme
set number
set background=dark
set cursorline

" faster display
set lazyredraw
set ttyfast

" bell
set visualbell
set t_vb=

if has('nvim')
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" mappings
inoremap <expr> <Tab> TabComplete()
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

" colors
" colorscheme ron
highlight ExtraWhitespace ctermbg=red guibg=red
highlight CursorLine cterm=None ctermbg=236 guibg=#333333
highlight LineNr ctermfg=239 guifg=#454545
highlight CursorLineNR ctermfg=243 guifg=#666666
match ExtraWhitespace /\s\+\%#\@<!$/

" tags
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

fun! TabComplete()
    if strpart(getline('.'), col('.') - 2, 1) =~ '\w'
        return "\<C-P>"
    else
        return "\<Tab>"
    endif
endfun

" autocmd InsertCharPre * call AutoComplete()
" aaaaa1
" aaaaa2
"

fun! AutoComplete()
    if !exists("s:initAutoComplete")
        let s:initAutoComplete = 1
        let s:wordLength = 0
        let s:lastColumn = -1
        let s:lastLine = -1
    endif

    if pumvisible()
        return ""
    endif

    if s:wordLength > 0
        let s:wordLength = 0
        call feedkeys("\<C-P>\<C-N>\<C-N>")
        return ""
    endif

    if v:char =~ '\w' && s:lastColumn + 1 == col('.') && getline('.') == s:lastLine
        let s:wordLength += 1
    else
        let s:wordLength = 0
    endif

    let s:lastColumn = col('.')
    let s:lastLine = getline('.')
endfun

