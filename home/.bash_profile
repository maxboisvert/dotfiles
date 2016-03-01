#!/bin/bash

umask 0002

function prependToPath {
	export PATH=$1:$PATH
}

function java6 {
	export JAVA_HOME="/backedUpFiles/soft/jdk/jdk1.6"
	prependToPath $JAVA_HOME/bin
}

function java7 {
	export JAVA_HOME="/backedUpFiles/soft/jdk/jdk1.7"
	prependToPath $JAVA_HOME/bin
}

function java8 {
	export JAVA_HOME="/backedUpFiles/soft/jdk/jdk1.8"
	prependToPath $JAVA_HOME/bin
}

function maven3 {
	export MAVEN_OPTS="-Xmx3g"
	export M2_HOME="/backedUpFiles/soft/apache-maven/apache-maven"
	export M2_REPO="/backedUpFiles/soft/apache-maven-repository"
	prependToPath $M2_HOME/bin
}

java8
maven3

export PAGER=less

export VISUAL="vim"
export EDITOR="$VISUAL"
export SVN_EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"

HISTSIZE=10000

prependToPath /home/soft/gitflow/
prependToPath /backedUpFiles/workspace/git-lexflow/git-lexflow-core/src/main/bash/
prependToPath /backedUpFiles/workspace/mb-release/
prependToPath $(find -L ~/boisvertm-bin -type d -printf ":%p")

# alias ruby=/cygdrive/c/RailsInstaller/Ruby2.2.0/bin/ruby.exe
# # alias rails=/cygdrive/c/RailsInstaller/Ruby2.2.0/bin/rails.bat

# prependToPath /cygdrive/c/RailsInstaller/Ruby2.2.0/bin

# https://github.com/junegunn/fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='ag -g ""'

alias fim='vim $(ag -g "" | fzf)'

bind 'set bell-style none'

