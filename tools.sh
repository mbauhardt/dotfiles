_installZshAutosuggestions() {
  [[ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]] && echo "\033[0;33mYou already have zsh-autosuggestions installed. Skip the installation.\033[0m" && return 1
  echo "zsh-autosuggestions is not yet installed. Performing the the installation now."
  git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
}

_installTmuxThemepack() {
  [[ -d ~/.tmux-themepack ]] && echo "\033[0;33mYou already have tmux-themepack installed. Skip the installation.\033[0m" && return 1
  echo "~/.tmux-themepack is not yet installed. Performing the the installation now."
  git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
}
