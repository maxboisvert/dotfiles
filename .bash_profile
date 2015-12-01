#!/bin/bash

umask 0002

function prependToPath {
	export PATH=$1:$PATH
}

function java6 {
	export JAVA_HOME="/home/soft/jdk/jdk1.6"
	prependToPath $JAVA_HOME/bin
}

function java7 {
	export JAVA_HOME="/home/soft/jdk/jdk1.7"
	prependToPath $JAVA_HOME/bin
}

function java8 {
	export JAVA_HOME="/home/soft/jdk/jdk1.8"
	prependToPath $JAVA_HOME/bin
}

function maven3 {
	export MAVEN_OPTS="-Xmx3g"
	export M2_HOME="/home/soft/apache-maven-3.3.3"
	export M2_REPO="/home/soft/apache-maven-repository"
	prependToPath $M2_HOME/bin
}

java8
maven3

# alias vim=nvim

export PAGER=more

export VISUAL="nvim"
export EDITOR="$VISUAL"
export SVN_EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"

HISTSIZE=10000

prependToPath /home/soft/gitflow/
prependToPath /backedUpFiles/workspace/git-lexflow/git-lexflow-core/src/main/bash/
prependToPath $(find -L ~/bin -type d -printf ":%p")
prependToPath /home/soft/templator/bin
prependToPath /home/soft/node-v0.12.7-linux-x64/bin
prependToPath /home/soft/infer-linux64-v0.1.0/infer/infer/bin

