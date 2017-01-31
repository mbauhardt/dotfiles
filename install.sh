#!/usr/bin/env sh

syncMyDotFiles() {
  rsync \
    --exclude ".git/" \
    --exclude ".DS_Store" \
    --exclude "install.sh" \
    --exclude "README.md" \
    --exclude "LICENSE" \
    -avh . ~
}

patchZshrc() {
  cp $HOME/.zshrc $HOME/.zshrc.sed
  sed -E 's/^plugins=.*/plugins=(git gradle zsh-autosuggestions z pass mbauhardt) /g' $HOME/.zshrc.sed > $HOME/.zshrc
  rm $HOME/.zshrc.sed
}

echo ""
echo ""

echo "Update dotfiles to latest version"
git pull origin master

echo ""
read -p "This may overwrite existing dotfiles in your home directory. Are you sure? (y/n) " -n 1;
echo ""
[[ $REPLY =~ ^[Yy]$ ]] && syncMyDotFiles && patchZshrc


echo ""
echo ""
echo "Installation done"
