call plug#begin()
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
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
    autocmd FileType "java,python,vim,sh,go,typescript" setl shiftwidth=4 softtabstop=4 tabstop=4
    autocmd BufEnter * if (winnr("$") == 1 && &buftype != "") | q | endif
    autocmd VimEnter * nested if len(argv()) > 0 | set viminfo= | else | e #<1 | endif
augroup END

runtime! plugin/sensible.vim

" options
colorscheme default
let g:is_bash = 1
let g:mapleader = ' '

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
set viminfo+=n.vim-viminfo2

" Mappings
noremap ; :
nnoremap <Backspace> <C-O>
nnoremap <Leader>\ :NERDTreeToggle<CR>
nnoremap <Leader>g :GoDef<CR>
" nnoremap <Leader>l :e #<1<CR>

nnoremap j gj
nnoremap k gk

nnoremap <Left> :cp<CR>
nnoremap <Right> :cn<CR>
" nnoremap <Up> :copen<CR>
" nnoremap <Down> :cclose<CR>

nnoremap <Leader>/ :BLines<CR>
nnoremap <Leader>a :Find<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>h :History<CR>

" inoremap <expr> <Tab> getline('.')[col('.') - 2] =~ '\k' ? "\<C-P>" : "\<Tab>"
inoremap <expr> <Tab> matchstr(getline('.'), '.\%' . col('.') . 'c') =~ '\k' ? "\<C-P>" : "\<Tab>"

" Commands
command CopyFilename let @+ = expand("%")
command! -bang -nargs=* Find call fzf#vim#ag(<q-args>, $AG_IGNORE, <bang>0)
