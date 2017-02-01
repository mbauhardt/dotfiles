echo ""

installBrew() {
  echo "Check if brew is installed"
  brew info 2> /dev/null
  [[ $? -eq 0 ]] && echo "Brew is already installed. Skip the installation." && return 1
  echo "Brew is not yet installed. Performing the installation now."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

installFormula() {
  [[ "$#" != 1 ]] && return 1
  local formula=$1
  brew list $formula 1> /dev/null 2> /dev/null
  [[ $? -eq 0 ]] && echo "$formula is already installed. Skip the installation." && return 1
  echo "$formula is not yet installed. Performing the installation now."
  brew install $formula 1>> logs/brew_install.log 2>> logs/brew_install_error.log
}

echo ""
echo "Start installation of brew"
installBrew

echo ""
echo "Start to install all needed formulas"
installFormula sbt
installFormula csshx
installFormula fzf
installFormula git
installFormula gradle
installFormula libdvdcss
installFormula maven
installFormula midnight-commander
installFormula monkeysphere
installFormula mysql
installFormula p7zip
installFormula pass
installFormula s3cmd
installFormula sbt
installFormula scala
installFormula tmux
installFormula tree
installFormula zsh-syntax-highlighting
