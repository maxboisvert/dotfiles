alias vim="nvim"

function prepend_to_path {
	export PATH=$1:$PATH
}

function my_bin {
    prepend_to_path $(ls -d ~/my-bin/* | tr '\n' ':')
}

my_bin

