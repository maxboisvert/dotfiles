" First setup: alias vim=nvim and source this file within vim
if !filereadable(stdpath('config') . '/init.vim')
    exe '! mkdir -p ' . stdpath('config')
    exe '! ln -s '. expand("~/.init.vim") . ' ' . stdpath('config') . '/init.vim'
endif

lua << EOF
require('packer').startup(function()
    -- https://github.com/wbthomason/packer.nvim
    use 'wbthomason/packer.nvim'
    use 'fatih/vim-go'
    use 'tpope/vim-commentary'
    use 'tpope/vim-sensible'

    use {
      "folke/which-key.nvim",
      config = function() require("which-key").setup() end
    }
end)
EOF

augroup vimrc
    autocmd!
    autocmd BufNewFile,BufRead Gemfile,Guardfile set filetype=ruby
    autocmd FileType "go" setl noexpandtab
    autocmd FileType "java,python,vim,sh,go,typescript" setl shiftwidth=4 softtabstop=4 tabstop=4
    autocmd BufReadPost * silent! normal! g`"
    autocmd ColorScheme * hi LineNr ctermfg=darkgray | hi CursorLine cterm=None ctermbg=238 | hi CursorLineNr cterm=None

    if !len(argv())
        set viminfo+=n.vim-viminfo-local
        autocmd VimEnter * nested silent! e #<1
    endif
augroup END

lua << EOF
vim.g.is_bash=1
vim.g.mapleader=' '

vim.cmd [[
runtime! plugin/sensible.vim
colorscheme default

set grepprg=git_vimgrep
set background=dark
set breakindent linebreak wrap
set clipboard=unnamedplus
set cursorline
set number
set hidden
set ignorecase smartcase
set list listchars=tab:\ \ ,trail:·
set mouse=a
set shiftwidth=2 softtabstop=2 tabstop=2 expandtab
set lazyredraw
set dir=/tmp/vim// backupdir=/tmp/vim// undodir=/tmp/vim//
" set autoindent copyindent preserveindent shiftround
]]
EOF

noremap ; :
nnoremap <Backspace> <C-O>
nnoremap <Leader>g :GoDef<CR>
nnoremap <Leader>[ :let @+ = expand("%")<CR>
nnoremap <silent> <Leader>s :exec ':e ~/scratch/' . strftime("%Y-%U") . '.scratch'<CR>

nnoremap <silent> <Leader>f :call SimpleFiles()<CR>
nnoremap <silent> <Leader>j :call SimpleMru()<CR>

nnoremap j gj
nnoremap k gk

nnoremap <Down> :cclose<CR>
nnoremap <Left> :cp<CR>
nnoremap <Right> :cn<CR>
nnoremap <Up> :copen<CR>

inoremap <expr> <Tab> matchstr(getline('.'), '.\%' . col('.') . 'c') =~ '\k' ? "<C-P>" : "<Tab>"

" Vim simple files
func! SimpleFiles()
    edit! .vim-vsf
    call system("git ls-files --others --exclude-standard --cached > .vim-vsf &")
    call BufferSettings()
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
    silent exec '%g/^[./]/d _'
    call BufferSettings()
    setl bufhidden=delete
    0
endfunc
