_installFormula() {
  [[ "$#" != 1 ]] && return 1
  local formula=$@
  brew list $formula 1> /dev/null 2> /dev/null
  [[ $? -eq 0 ]] && echo "\033[0;33m$formula is already installed. Skip the installation.\033[0m" && return 1
  echo "$formula is not yet installed. Performing the installation now."
  brew install $formula 1>> logs/brew_install.log 2>> logs/brew_install_error.log
}

