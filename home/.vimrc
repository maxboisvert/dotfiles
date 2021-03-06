
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
Plug 'lifepillar/vim-mucomplete'
call plug#end()

augroup vimrc
    autocmd!
    autocmd BufNewFile,BufRead Gemfile,Guardfile set filetype=ruby
    autocmd ColorScheme * hi LineNr ctermfg=darkgray | hi CursorLine cterm=NONE ctermbg=238
    autocmd FileType "go" setl noexpandtab
    autocmd FileType "java,python,vim,sh,go,typescript" setl shiftwidth=4 softtabstop=4 tabstop=4
    autocmd BufReadPost * silent! normal! g`"
    autocmd BufRead .vim-vsf :call BufferSettings()

    if !len(argv())
        set viminfo+=n.vim-viminfo-local
        autocmd VimEnter * nested silent! e #<1
    endif
augroup END

runtime! plugin/sensible.vim

colorscheme default
let g:is_bash = 1
let g:mapleader = ' '

let g:mucomplete#chains = { 'default' : ['c-p'] }
let g:mucomplete#enable_auto_at_startup = 1
set completeopt+=menuone,noselect pumheight=10

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

" simple files
func! SimpleFiles()
    edit! .vim-vsf
    call system("git ls-files --others --exclude-standard --cached > .vim-vsf &")
endfunc

func! BufferSettings()
    setl buftype=nofile nobuflisted bufhidden=hide
    map <buffer> <silent> <CR> gf
endfunc

fun! SimpleMru()
    wviminfo | rviminfo!
    enew
    0put =v:oldfiles
    silent exec '%s?' . getcwd() . '/??e'
    silent exec '%g/^[./]/d'
    call BufferSettings()
    setl bufhidden=delete
    0
endfunc
