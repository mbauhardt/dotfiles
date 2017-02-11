
_installBrew() {
  echo "\033[0;33mCheck if brew is installed.\033[0m"
  brew info 2> /dev/null
  [[ $? -eq 0 ]] && echo "\033[0;33mBrew is already installed. Skip the installation.\033[0m" && return 1
  echo "Brew is not yet installed. Performing the installation now."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

_installFormula() {
  [[ "$#" != 1 ]] && return 1
  local formula=$1
  brew list $formula 1> /dev/null 2> /dev/null
  [[ $? -eq 0 ]] && echo "\033[0;33m$formula is already installed. Skip the installation.\033[0m" && return 1
  echo "$formula is not yet installed. Performing the installation now."
  brew install $formula 1>> logs/brew_install.log 2>> logs/brew_install_error.log
}

_installFormulas() {
  _installFormula sbt
  _installFormula csshx
  _installFormula fzf
  _installFormula git
  _installFormula gradle
  _installFormula libdvdcss
  _installFormula maven
  _installFormula midnight-commander
  _installFormula monkeysphere
  _installFormula mysql
  _installFormula p7zip
  _installFormula pass
  _installFormula s3cmd
  _installFormula sbt
  _installFormula scala
  _installFormula tmux
  _installFormula tree
  _installFormula zsh-syntax-highlighting
  _installFormula yubikey-personalization
#  _installFormula gpg2
}
