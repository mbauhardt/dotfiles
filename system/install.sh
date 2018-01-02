source lib/brew.sh

_installBrew() {
  echo "\033[0;33mCheck if brew is installed.\033[0m"
  brew info 2> /dev/null
  [[ $? -eq 0 ]] && echo "\033[0;33mBrew is already installed. Skip the installation.\033[0m" && return 1
  echo "Brew is not yet installed. Performing the installation now."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

_installBrew
_installFormula git
_installFormula gpg2
