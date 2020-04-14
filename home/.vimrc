call plug#begin()
Plug 'fatih/vim-go'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tmsvg/pear-tree'
Plug 'AndrewRadev/splitjoin.vim'
call plug#end()

augroup vimrc
    autocmd!
    autocmd BufNewFile,BufRead Gemfile,Guardfile set filetype=ruby
    autocmd ColorScheme * hi LineNr ctermfg=darkgray | hi CursorLine cterm=NONE ctermbg=238
    autocmd FileType "go" setl noexpandtab
    autocmd FileType "java,python,vim,sh,go,typescript" setl shiftwidth=4 softtabstop=4 tabstop=4
    autocmd BufReadPost * silent! normal! g`"
    if !len(argv())
        set viminfo+=n.vim-viminfo-local
        autocmd VimEnter * nested silent! e #<1
    endif
augroup END

runtime! plugin/sensible.vim

colorscheme default
let g:is_bash = 1
let g:mapleader = ' '

set grepprg=git_vimgrep
set background=dark
set breakindent linebreak wrap
set clipboard^=unnamedplus,unnamed
set cursorline
set number
set hidden
set ignorecase smartcase
set list listchars=tab:\ \ ,trail:·
set mouse=a
set shiftwidth=2 softtabstop=2 tabstop=2 expandtab
set lazyredraw

noremap ; :
nnoremap <Backspace> <C-O>
nnoremap <Leader>g :GoDef<CR>
nnoremap <silent> <Leader>f :grep '' ''
nnoremap <silent> <Leader>j :call SimpleMru()<CR>
nnoremap <Leader>[ :let @+ = expand("%")<CR>

autocmd BufRead *.scratch setl bufhidden=unload autowrite nobuflisted
nnoremap <expr> <Leader>s ':e ~/scratch/' . strftime("%Y-%U") . '.scratch<CR>'
nnoremap <Leader>d :vimgrep /\[[^x]\]/j ~/scratch/*<CR>

nnoremap j gj
nnoremap k gk

nnoremap <Down> :cclose<CR>
nnoremap <Left> :cp<CR>
nnoremap <Right> :cn<CR>
nnoremap <Up> :copen<CR>

inoremap <expr> <Tab> matchstr(getline('.'), '.\%' . col('.') . 'c') =~ '\k' ? "<C-P>" : "<Tab>"
