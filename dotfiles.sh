#!/usr/bin/env sh

_syncMyDotFiles() {
  echo "Start to sync dotfiles."
  rsync \
    --exclude ".DS_Store" \
    --exclude ".gitignore" \
    --exclude "README.md" \
    --exclude "LICENSE" \
    --exclude "logs/" \
    --exclude ".git/" \
    --exclude "ohmyzsh.sh" \
    --exclude "brew.sh" \
    --exclude "tools.sh" \
    --exclude "dotfiles.sh" \
    --exclude "install.sh" \
    -avh . ~
}

_updateDotFiles() {
  echo "Update dotfiles to latest version."
  git pull origin master
}

