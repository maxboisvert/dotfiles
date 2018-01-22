call plug#begin()
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
    autocmd VimLeavePre * mksession! .vim-session
    autocmd VimResized * wincmd =
augroup END

runtime! plugin/sensible.vim

" options
colorscheme default
let g:is_bash = 1
let g:mapleader = ' '
scriptencoding utf-8

" indent/wrap
set expandtab
set shiftwidth=2 softtabstop=2 tabstop=2
set breakindent linebreak wrap

" ui
set background=dark
set number
set cursorline
set mouse=a
set laststatus=0
set grepprg=ag\ --vimgrep

" state
exec "set viminfo+=" . (has("nvim") ? "n.vim-nviminfo" : "n.vim-viminfo")
set clipboard^=unnamedplus,unnamed
set confirm
set hidden

" Mappings
nnoremap ; q:<Up>
nnoremap <Backspace> <C-O>
nnoremap <Leader><Tab> :b#<CR>
nnoremap <Leader>g :GoDef<CR>
nnoremap <Leader>q :qa<CR>
nnoremap <Leader>s :source .vim-session<CR>

nnoremap <Leader>/ :BLines<CR>
nnoremap <Leader>a :Find<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>l :Lines<CR>
nnoremap <Leader>w :Windows<CR>

nnoremap j gj
nnoremap k gk

" Commands
command FileToClipboard let @+ = expand("%")
command! -bang -nargs=* Find call fzf#vim#ag(<q-args>, $AG_IGNORE, <bang>0)
