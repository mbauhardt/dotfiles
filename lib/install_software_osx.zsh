function _installFormula() {
  local formula=$@
  brew list $formula 1> /dev/null 2> /dev/null
  [[ $? -eq 0 ]] &&  return 2
  brew install $formula 1>> ${DOTFILESDIR:-$HOME/dotfiles}/logs/install.log 2>> ${DOTFILESDIR:-$HOME/dotfiles}/logs/install_error.log
  return $?
}

function _installCask() {
  local formula=$@
  brew cask list $formula 1> /dev/null 2> /dev/null
  [[ $? -eq 0 ]] &&  return 2
  brew cask install $formula 1>> ${DOTFILESDIR:-$HOME/dotfiles}/logs/install.log 2>> ${DOTFILESDIR:-$HOME/dotfiles}/logs/install_error.log
  return $?
}

zstyle -a ":dotfiles:load" brew apps

printf "Install software from the given modules '%s'\n" "${apps}"
read "con?Do you want to continue? (y/n)"
[[ "$con" =~ ^[Yy]$ ]] || exit 1

for app in "$apps[@]";do 
  
  printf "Install brew formula '%s'." "${app}"
  _installFormula $app
  local ret=$?
  ([[ $ret -eq 0 ]] && printf "[\033[0;32mOK\033[0m]\n") || ([[ $ret -eq 1 ]] && printf "[\033[0;31mERROR\033[0m]\n") || ([[ $ret -eq 2 ]] && printf "[\033[0;33mSKIP\033[0m]\n")


;done


zstyle -a ":dotfiles:load" cask apps

printf "Install software from the given modules '%s'\n" "${apps}"
read "con?Do you want to continue? (y/n)"
[[ "$con" =~ ^[Yy]$ ]] || exit 1

for app in "$apps[@]";do 
  
  printf "Install brew cask '%s'." "${app}"

  printf "Install cask '%s'." "${app}"
  _installCask $app
  local ret=$?
  ([[ $ret -eq 0 ]] && printf "[\033[0;32mOK\033[0m]\n") || ([[ $ret -eq 1 ]] && printf "[\033[0;31mERROR\033[0m]\n") || ([[ $ret -eq 2 ]] && printf "[\033[0;33mSKIP\033[0m]\n")


;done
