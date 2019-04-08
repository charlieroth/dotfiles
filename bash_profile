#!/bin/sh

export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$MAVEN_HOME/bin
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/flutter/bin:$PATH"
export PATH="$PATH:/Users/charlie/.nvm/versions/node/v10.10.0/bin"
export PATH="$PATH:/path/to/elixir/bin"
export PATH="/Users/charlie/.deno/bin:$PATH"
export NVM_DIR=~/.nvm
. $(brew --prefix nvm)/nvm.sh
export ANDROID_HOME=$HOME/Library/Android/sdk
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home
export GOPATH=$HOME/development/go
export PATH=$PATH:$GOPATH
export GOBIN=$HOME/development/go/bin
export PATH=$PATH:$GOBIN

mg() { mkdir "$@" && cd "$@" || exit; }
npm-latest() { npm info "$1" | grep latest; }
killport() { lsof -i tcp:"$*" | awk 'NR!=1 {print $2}' | xargs kill -9; }

# shell prompt
export PS1="\u: \W $ "
source ~/.bashrc
