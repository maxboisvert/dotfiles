call plug#begin()
Plug $VIM_DEV . 'maxboisvert/vim-simple-complete'
Plug $VIM_DEV . 'maxboisvert/vim-simple-mru'
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
    autocmd ColorScheme * hi LineNr ctermfg=darkgray | hi CursorLine cterm=NONE ctermbg=237
    autocmd FileType go setlocal noexpandtab
    autocmd FileType java,python,vim,sh,go,typescript setl shiftwidth=4 softtabstop=4 tabstop=4
    autocmd BufEnter * if (winnr("$") == 1 && &buftype != "") | q | endif
augroup END

runtime! plugin/sensible.vim

" options
colorscheme default
let g:is_bash = 1
let g:mapleader = ' '
let g:vsm_exclude = 'NERD|COMMIT_\|git-\|/\.vim\|__'

" indent/wrap
set expandtab
set shiftwidth=2 softtabstop=2 tabstop=2
set breakindent linebreak wrap

" ui
set background=dark
set number
set cursorline
set mouse=a
set laststatus=1
set grepprg=ag\ --vimgrep

" state
set clipboard^=unnamedplus,unnamed
set hidden
set complete-=t
" set viminfo+=n.vim-viminfo2

" Mappings
noremap ; :
nnoremap <Backspace> <C-O>
" nnoremap <Leader><Tab> :b#<CR>
nnoremap <Leader>\ :NERDTreeToggle<CR>
nnoremap <Leader>g :GoDef<CR>

nnoremap j gj
nnoremap k gk

nnoremap <Left> :cp<CR>
nnoremap <Right> :cn<CR>

nnoremap <Leader>e :e **/*
nnoremap <Leader>/ :BLines<CR>
nnoremap <Leader>a :Find<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>h :SimpleMRU<CR>

" Commands
command CopyFilename let @+ = expand("%")
command! -bang -nargs=* Find call fzf#vim#ag(<q-args>, $AG_IGNORE, <bang>0)

" inoremap <expr> <Tab> getline('.')[col('.') - 2] =~ '\K' ? "\<C-P>" : "\<Tab>"
