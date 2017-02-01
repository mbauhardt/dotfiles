
installOhMyZsh() {
  echo ""
  [[ -d $HOME/.oh-my-zsh ]] && echo "\033[0;33mYou already have Oh My Zsh installed.\033[0m Skip the installation." && return 1
  echo "Ohm My Zsh is not yet installed. Performing the the installation now."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

patchZshrc() {
  echo "Patch ~/.zshrc to include specific ohmyzsh plugins."
  cp $HOME/.zshrc $HOME/.zshrc.sed
  sed -E 's/^plugins=.*/plugins=(git gradle zsh-autosuggestions z pass mbauhardt) /g' $HOME/.zshrc.sed > $HOME/.zshrc
  rm $HOME/.zshrc.sed
}

installOhMyZsh
patchZshrc
