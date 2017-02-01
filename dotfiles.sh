#!/usr/bin/env sh

syncMyDotFiles() {
  echo ""
  read -p "This may overwrite existing dotfiles in your home directory. Are you sure? (y/n) " -n 1;
  echo ""
  [[ $REPLY =~ ^[Yy]$ ]] && echo "Start to sync dotfiles." && rsync \
    --exclude ".DS_Store" \
    --exclude ".gitignore" \
    --exclude "README.md" \
    --exclude "LICENSE" \
    --exclude "logs/" \
    --exclude ".git/" \
    --exclude "ohmyzsh.sh" \
    --exclude "brew.sh" \
    --exclude "dotfiles.sh" \
    -avh . ~
}

updateDotFiles() {
  echo "Update dotfiles to latest version"
  git pull origin master
}

updateDotFiles
syncMyDotFiles

