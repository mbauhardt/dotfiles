source lib/brew.sh
source lib/dotfiles.sh

_installInteractiveCd() {
  echo ""
  [[ -d $HOME/.oh-my-zsh/custom/plugins/zsh-interactive-cd ]] && echo "\033[0;33mYou already have zsh-interactive-cd installed. Skip the installation.\033[0m" && return 1
  echo "zsh-interactive-cd is not yet installed. Performing the the installation now."
  sh -c "$(g clone git@github.com:changyuheng/zsh-interactive-cd.git $ZSH_CUSTOM/plugins)"
}

_installFz() {
  echo ""
  [[ -d $HOME/.oh-my-zsh/custom/plugins/fz ]] && echo "\033[0;33mYou already have fz installed. Skip the installation.\033[0m" && return 1
  echo "fz is not yet installed. Performing the the installation now."
  sh -c "$(g clone git@github.com:changyuheng/fz.git $ZSH_CUSTOM/plugins)"
}

_installOhMyZsh() {
  echo ""
  [[ -d $HOME/.oh-my-zsh ]] && echo "\033[0;33mYou already have Oh My Zsh installed. Skip the installation.\033[0m" && return 1
  echo "Ohm My Zsh is not yet installed. Performing the the installation now."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}


_installTmuxThemepack() {
  [[ -d ~/.tmux-themepack ]] && echo "\033[0;33mYou already have tmux-themepack installed. Skip the installation.\033[0m" && return 1
  echo "~/.tmux-themepack is not yet installed. Performing the the installation now."
  git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
}

_installBase16Colors() {
  [[ -d ~/.config/base16-shell ]] && echo "\033[0;33mYou already have base16-shell installed. Skip the installation.\033[0m" && return 1
  echo "~/.config/base16-shell is not yet installed. Performing the the installation now."
  git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
}

_installOhMyZsh
_installInteractiveCd
_installFz
_installTmuxThemepack
_installBase16Colors

_installFormula csshx
_installFormula zsh-autosuggestions
_installFormula fzf
_installFormula midnight-commander
_installFormula ranger
_installFormula p7zip
_installFormula s3cmd
_installFormula tmux
_installFormula tree
_installFormula zsh-syntax-highlighting
_installFormula the_silver_searcher

_syncMyDotFiles shell/files

