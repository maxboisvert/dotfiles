# mru
declare-option -docstring 'Path to history file' str cmdhist_file ".vim-mru4"

set-option global tabstop 2
set-option global indentwidth 2

set-option global grepcmd 'git_vimgrep'

# Shortcut to quickly exit the editor
define-command -docstring "save and quit" x "write-all; quit"

# Display line numbers
add-highlighter global/ number-lines -hlcursor

# Always keep lines displayed around the cursor
set-option global scrolloff 5,5

# Softwrap long lines
add-highlighter global/ wrap -word -indent

# Highlight trailing whitespace
add-highlighter global/ regex \h+$ 0:Error

map global normal ';' ':'

map global normal '<space>' ','

map global user -docstring "comment line" 'c' ': comment-line<ret>'

map global user -docstring "next match" '<right>' ': grep-next-match<ret>'
map global user -docstring "previous match" '<left>' ': grep-previous-match<ret>'

map global user -docstring "list files" 'f' ': grep ""<ret>'
map global user -docstring "list files" 'g' ': buffer *grep*<ret>'

map global normal -docstring "jump backward" '<backspace>' '<c-o>'

def cmdhist-save -override %{
  echo -to-file %opt{cmdhist_file} -quoting kakoune -- %reg{colon}
}
def cmdhist-load -override %{
  eval reg colon %sh{ cat "$kak_opt_cmdhist_file" }
}
hook  global KakEnd   .* %{ cmdhist-save }
hook  global KakBegin .* %{ cmdhist-load }
