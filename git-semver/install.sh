#!/usr/bin/env bash

set -e

echo ''

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}


setup_git_semver() {
  local dir=$HOME/Projects/Apps/git-semver
  info 'setup git-semver'
  if ! [[ -d "${dir}"  ]]
  then
    git clone -q https://github.com/beleneglorion/git-semver.git "${dir}"
    cd $dir
    chmod u+x ./install.sh
    ./install.sh
    success 'git semver'
  else
    info 'git-semver already installed'
  fi
}


setup_git_semver