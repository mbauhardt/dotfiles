function _installFormula() {
  local formula=$@
  brew list $formula 1> /dev/null 2> /dev/null
  [[ $? -eq 0 ]] &&  return 2
  brew install $formula 1>> ${DOTFILESDIR:-$HOME/dotfiles}/logs/brew_install.log 2>> ${DOTFILESDIR:-$HOME/dotfiles}/logs/brew_install_error.log
  return $?
}

function _downloadUrl() {
  local from=$1
  local to=$2
  [[ -a $to ]] && echo "\033[0;33m$to already exist. Skip the download.\033[0m" && return 1
  curl -fLo ${to} --create-dirs ${from} 
}

function _gitCheckout() {
  local from=$1
  local to=$2
  [[ -d $to ]] && echo "\033[0;33m$to already exist. Skip the git checkout.\033[0m" && return 1
  git clone --recursive $from $to
}

zstyle -a ":dotfiles:load" dmodules dots
printf "Install software from the given modules '%s'\n" "${dots}"

for dot in "$dots[@]";do 
  
  [[ ! -a ${DOTFILESDIR:-$HOME/dotfiles}/modules/$dot/install-software.zsh ]] && continue
  source ${DOTFILESDIR:-$HOME/dotfiles}/modules/$dot/install-software.zsh

  # install via homebrew
  zstyle -a ":dotfiles:modules:${dot}:software" brew formulae
  for f in $formulae[@];do
    printf "[%s] Install brew formula '%s'." "${dot}" "${f}"
    _installFormula $f
    local ret=$?
    ([[ $ret -eq 0 ]] && printf "[\033[0;32mOK\033[0m]\n") || ([[ $ret -eq 1 ]] && printf "[\033[0;31mERROR\033[0m]\n") || ([[ $ret -eq 2 ]] && printf "[\033[0;33mSKIP\033[0m]\n")
  ;done

  # install via curl
  typeset -A urls
  zstyle -a ":dotfiles:modules:${dot}:software" curl urls
  for k v in ${(kv)urls};do
    printf "[%s] Download file '%s' to '%s'.\n" "${dot}" "${k}" "${v}"
    _downloadUrl $k $v
  ;done

  # install via git
  typeset -A repos
  zstyle -a ":dotfiles:modules:${dot}:software" git repos
  for k v in ${(kv)repos};do
    printf "[%s] Git checkout repo '%s' to '%s'.\n" "${dot}" "${k}" "${v}"
    _gitCheckout $k $v
  ;done

  # call post install script
  [[ ! -a ${DOTFILESDIR:-$HOME/dotfiles}/modules/$dot/post-install-software.zsh ]] && continue
  printf "[%s] Source post-install-software script.\n" "${dot}" && source ${DOTFILESDIR:-$HOME/dotfiles}/modules/$dot/post-install-software.zsh

;done


