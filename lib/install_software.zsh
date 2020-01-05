if [[ "$OSTYPE" == "linux-gnu" ]]; then
  source ${DOTFILESDIR:-$HOME/dotfiles}/lib/install_software_linux.zsh
elif [[ "$OSTYPE" == "darwin"* ]]; then
  source ${DOTFILESDIR:-$HOME/dotfiles}/lib/install_software_osx.zsh
fi

