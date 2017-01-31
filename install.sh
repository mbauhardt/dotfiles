#!/usr/bin/env sh

echo ""
echo ""

echo "Update dotfiles to latest version"
git pull origin master

echo ""
read -p "This may overwrite existing dotfiles in your home directory. Are you sure? (y/n) " -n 1;
echo ""


syncMyDotFiles() {
  rsync \
    --exclude ".git/" \
    --exclude ".DS_Store" \
    --exclude "install.sh" \
    --exclude "README.md" \
    --exclude "LICENSE" \
    -avh . ~
}

[[ $REPLY =~ ^[Yy]$ ]] && syncMyDotFiles

echo ""
echo ""
echo "Installation done"
