" curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin()
Plug 'fatih/vim-go'
Plug 'tpope/vim-commentary'
Plug 'folke/which-key.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-lua/plenary.nvim'
Plug 'hrsh7th/cmp-buffer'
call plug#end()

lua << EOF
require("which-key").setup()

local cmp = require 'cmp'
cmp.setup {
    sources = {
        {
            name = 'buffer',
            keyword_length = 3,
            option = {
                get_bufnrs = function()
                    return vim.api.nvim_list_bufs()
                end
            }
        },
    },
    mapping = { ['<CR>'] = cmp.mapping.confirm({select = true}) },
    completion = { completeopt = 'menu,menuone,noinsert' },
    experimental = { ghost_text = true }
}
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

colorscheme default
let g:is_bash = 1
let g:mapleader = ' '

set grepprg=git_vimgrep
set background=dark
set cursorline
set number
set clipboard=unnamedplus
set mouse=a
set lazyredraw
set ignorecase smartcase
set breakindent linebreak wrap
set list listchars=tab:\ \ ,trail:·
set shiftwidth=2 softtabstop=2 tabstop=2 expandtab
" set copyindent preserveindent shiftround

noremap ; :
nnoremap <Backspace> <C-O>
nnoremap <Leader>g :GoDef<CR>
nnoremap <Leader>[ :let @+ = expand("%")<CR>
nnoremap <silent> <Leader>s :exec ':e ~/scratch/' . strftime("%Y-%U") . '.scratch'<CR>

nnoremap <silent> <Leader>f :Telescope find_files<CR>
nnoremap <silent> <Leader>j :Telescope oldfiles<CR>

nnoremap j gj
nnoremap k gk

nnoremap <Down> :cclose<CR>
nnoremap <Left> :cp<CR>
nnoremap <Right> :cn<CR>
nnoremap <Up> :copen<CR>

" inoremap <expr> <Tab> matchstr(getline('.'), '.\%' . col('.') . 'c') =~ '\k' ? "<C-P>" : "<Tab>"
