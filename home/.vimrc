
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
call plug#end()

let g:vsf_file = ".vim-vsf"
" let g:vsf_file = tempname()
let g:vsf_command = "git ls-files --others --exclude-standard --cached"

augroup vimrc
    autocmd!
    autocmd BufNewFile,BufRead Gemfile,Guardfile set filetype=ruby
    autocmd ColorScheme * hi LineNr ctermfg=darkgray | hi CursorLine cterm=NONE ctermbg=238
    autocmd FileType "go" setl noexpandtab
    autocmd FileType "java,python,vim,sh,go,typescript" setl shiftwidth=4 softtabstop=4 tabstop=4
    autocmd BufReadPost * silent! normal! g`"

    exec "autocmd BufRead " g:vsf_file . " :call BufferSettings()"

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
nnoremap <Leader>[ :let @+ = expand("%")<CR>

nnoremap <silent> <Leader>f :call SimpleFiles()<CR>
nnoremap <silent> <Leader>j :call SimpleMru()<CR>

nnoremap j gj
nnoremap k gk

nnoremap <Down> :cclose<CR>
nnoremap <Left> :cp<CR>
nnoremap <Right> :cn<CR>
nnoremap <Up> :copen<CR>

" Simple notes
nnoremap <silent> <Leader>s :exec ':e ~/scratch/' . strftime("%Y-%U") . '.scratch'<CR>
nnoremap <silent> <Leader>d :vimgrep /^\[[^x]\{,1}\]/j ~/scratch/*<CR>
nnoremap <silent> <Leader>t :let @+ = strftime('%F')<CR>

" tab complete
inoremap <expr> <Tab> matchstr(getline('.'), '.\%' . col('.') . 'c') =~ '\k' ? "<C-P>" : "<Tab>"

" simple files
func! SimpleFiles()
    exec "edit! " . g:vsf_file
    call system(g:vsf_command . " > " . g:vsf_file . " &")
endfunc

func! BufferSettings()
    setl buftype=nowrite nobuflisted bufhidden=hide noswapfile nomodifiable autoread
    map <buffer> <silent> <CR> gf
endfunc

fun! SimpleMru()
    wviminfo | rviminfo!
    enew
    0put =v:oldfiles
    silent exec '%s?' . getcwd() . '/??e'
    silent exec '%g/^[./]/d'
    call BufferSettings()
    0
endfunc
