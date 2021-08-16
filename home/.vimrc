
if !filereadable(expand("~/.vim/autoload/plug.vim"))
    exec '! curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

if has('nvim') && !filereadable(stdpath('config') .'/init.vim')
    call mkdir(stdpath('config'), 'p')
    exe '! ln -s '. expand("~/.init.vim") . ' ' . stdpath('config') .'/init.vim'
endif

call plug#begin()
Plug 'fatih/vim-go'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tmsvg/pear-tree'
Plug 'AndrewRadev/splitjoin.vim'

let dev = '/Users/maximeboisvert/src/github.com/'
Plug dev . 'maxboisvert/vim-simple-complete'
Plug dev . 'maxboisvert/vim-simple-files'

call plug#end()

augroup vimrc
    autocmd!
    autocmd BufNewFile,BufRead Gemfile,Guardfile set filetype=ruby
    autocmd ColorScheme * hi LineNr ctermfg=darkgray | hi CursorLine cterm=NONE ctermbg=238
    autocmd FileType "go" setl noexpandtab
    autocmd FileType "java,python,vim,sh,go,typescript" setl shiftwidth=4 softtabstop=4 tabstop=4
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
nnoremap <Leader>[ :let @+ = expand("%")<CR>
nnoremap <silent> <Leader>s :exec ':e /tmp/' . strftime("%Y-%U") . '.scratch'<CR>

nnoremap <silent> <Leader>f :call SimpleFiles()<CR>
nnoremap <silent> <Leader>j :call SimpleMru()<CR>

nnoremap j gj
nnoremap k gk

nnoremap <Down> :cclose<CR>
nnoremap <Left> :cp<CR>
nnoremap <Right> :cn<CR>
nnoremap <Up> :copen<CR>
