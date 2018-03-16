call plug#begin()
Plug $VIM_DEV . 'maxboisvert/vim-simple-complete'
Plug 'maxboisvert/vim-simple-bookmarks'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'vim-scripts/gitignore'
Plug 'yegappan/mru'
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

" Mappings
nnoremap ; :
nnoremap <Backspace> <C-O>
nnoremap <Leader><Tab> :b#<CR>
nnoremap <Leader>\ :NERDTreeToggle<CR>
nnoremap <Leader>g :GoDef<CR>

nnoremap j gj
nnoremap k gk

nnoremap <Leader>/ :BLines<CR>
nnoremap <Leader>a :Find<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>h :MRU<CR>

" Commands
command CopyFilename let @+ = expand("%")
command! -bang -nargs=* Find call fzf#vim#ag(<q-args>, $AG_IGNORE, <bang>0)

let g:MRU_File = ".vim-mru"
let g:MRU_Auto_Close = 0
let g:MRU_Window_Height = 5
let MRU_Exclude_Files = "vim|git"
