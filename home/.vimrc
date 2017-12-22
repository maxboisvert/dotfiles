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
    autocmd BufEnter * match Error /\s\+\%#\@<!$/
    autocmd BufNewFile,BufRead Gemfile,Guardfile set filetype=ruby
    autocmd BufReadPost * silent! normal! g`"
    autocmd ColorScheme * hi LineNr ctermfg=darkgray | hi CursorLine cterm=NONE
    autocmd FileType go setlocal noexpandtab
    autocmd FileType java,python,vim,sh,go,typescript setl shiftwidth=4 softtabstop=4 tabstop=4
    autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

runtime! plugin/sensible.vim

" options
colorscheme default
let g:mapleader = ' '
scriptencoding utf-8

" indent
set expandtab
set shiftwidth=2 softtabstop=2 tabstop=2

" wrap
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
" set directory=/dev/shm
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
nnoremap <Backspace> <C-O>

" fzf/ag
command! -bang -nargs=* Ag2 call fzf#vim#ag(<q-args>, $AG_IGNORE, <bang>0)
let &grepprg = 'ag --vimgrep'
nnoremap <Leader>a :Ag2<CR>
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>l :Lines<CR>

" nerdtree
nnoremap <Leader>\ :NERDTreeToggle<CR>
nnoremap <Leader>v :NERDTreeFind<CR>

vnoremap < <gv
vnoremap > >gv
