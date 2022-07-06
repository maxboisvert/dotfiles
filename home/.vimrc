" First setup: alias vim=nvim and source this file within vim
if !filereadable(stdpath('config') . '/init.vim')
    exe '! mkdir -p ' . stdpath('config')
    exe '! ln -s '. expand("~/.init.vim") . ' ' . stdpath('config') . '/init.vim'
endif

lua << EOF
require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- https://github.com/wbthomason/packer.nvim
    use 'fatih/vim-go'
    use 'tpope/vim-commentary'
    use 'tpope/vim-sensible'
    use {
      "folke/which-key.nvim",
      config = function() require("which-key").setup() end
    }
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'hrsh7th/nvim-cmp',
        requires = { {'hrsh7th/cmp-buffer'} }
    }
end)

local cmp = require 'cmp'
cmp.setup {
    sources = cmp.config.sources {
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
    mapping = {
      ['<CR>'] = cmp.mapping.confirm({select = true}),
    },
    completion = { completeopt = 'menu,menuone,noinsert' }
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

lua << EOF
vim.cmd('runtime! plugin/sensible.vim')
vim.cmd('colorscheme default')

vim.g.is_bash=1
vim.g.mapleader=' '

(function(set)
	set.grepprg="git_vimgrep"
	set.background="dark"
	set.cursorline=true
	set.number=true
	set.clipboard="unnamedplus"
	set.mouse="a"
	set.lazyredraw=true

	set.ignorecase=true
    set.smartcase=true

    set.breakindent=true
    set.linebreak=true
	set.wrap=true

    set.list=true
    -- set.listchars='tab:\ \ ,trail:·'

    set.shiftwidth=2
	set.softtabstop=2
	set.tabstop=2
 	set.expandtab=true

    --set dir=/tmp/vim// backupdir=/tmp/vim// undodir=/tmp/vim//

    -- set autoindent copyindent preserveindent shiftround
end)(vim.opt)
EOF

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
