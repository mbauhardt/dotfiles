#!/usr/bin/env sh

_syncMyDotFiles() {
  [[ "$#" != 1 ]] && return 1
  local from=`echo $(cd $1; pwd)`
  local to=$1
  echo "Start to sync dotfiles from $from to $to in 3 sec."
  sleep 3
  rsync -avh $from/ $to
}

_updateDotFiles() {
  echo "Update dotfiles to latest version."
  git pull origin master
}

