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
prependToPath $(find -L ~/bin -type d -printf ":%p")

