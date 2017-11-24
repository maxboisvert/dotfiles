call plug#begin()
" Plug 'leafgarland/typescript-vim'
" Plug 'posva/vim-vue'
Plug $VIM_DEV . 'maxboisvert/vim-simple-complete'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'vim-scripts/gitignore'
call plug#end()

" Autocommands
augroup vimrc
    autocmd!

    autocmd ColorScheme * highlight LineNr ctermfg=darkgray
    autocmd ColorScheme * highlight! link NonText LineNr
    autocmd ColorScheme * highlight CursorLine cterm=NONE

    autocmd BufEnter * match Error /\s\+\%#\@<!$/
    autocmd BufNewFile,BufRead Gemfile,Guardfile set filetype=ruby
    autocmd FileType go setlocal noexpandtab
    autocmd FileType java,python,vim,sh,go,typescript setlocal shiftwidth=4 tabstop=4 softtabstop=4
    autocmd BufReadPost * silent! normal! g`"

    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

runtime! plugin/sensible.vim

" options
colorscheme default
let g:mapleader = ' '
scriptencoding utf-8

" indent
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" wrap
let &showbreak='↳ '
set breakindent
set linebreak
set wrap

" search
set hlsearch
set ignorecase
set smartcase
set incsearch

" ui
set background=dark
set number
set showmode
set cursorline
set mouse=a
set laststatus=0

" state
set clipboard^=unnamedplus,unnamed
set undolevels=1000
set hidden
exec "set viminfo+=" . (has("nvim") ? "n.vim-nviminfo" : "n.vim-viminfo")

" Mappings
nnoremap j gj
nnoremap k gk

map <Leader>/ gcc
map <Leader><Tab> :b#<CR>
nnoremap <Leader>[ :let @+ = expand("%")<CR>
noremap ; :
nnoremap <Leader>g :GoDef<CR>
nnoremap <Leader>] :wincmd w<CR>

" fzf/ag
command! -bang -nargs=* Ag2 call fzf#vim#ag(<q-args>, $AG_IGNORE, <bang>0)
let &grepprg = 'ag --vimgrep'
nnoremap <Leader>a :Ag2<CR>
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Backspace> <C-O>

" nerdtree
nnoremap <Leader>\ :NERDTreeToggle<CR>
nnoremap <Leader>v :NERDTreeFind<CR>
