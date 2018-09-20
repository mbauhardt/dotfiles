function _symbolicLink() {
  local lnk=$1
  local gitFile=$2
  [[ -a $lnk ]] && return 2;
  mkdir -p ${lnk:h}
  ln -s ${gitFile} $lnk 
  return $?
}

zstyle -a ":dotfiles:load" dmodules dots
printf "Link all files from the given modules '%s'\n" "${dots}"
read "con?Do you want to continue? (y/n)"
[[ "$con" =~ ^[Yy]$ ]] || exit 1

for dot in "$dots[@]";do 
  
  [[ ! -d ${DOTFILESDIR:-$HOME/dotfiles}/modules/$dot/files ]] && continue
  pushd ${DOTFILESDIR:-$HOME/dotfiles}/modules/$dot/files > /dev/null
  
  for f in **/*(D.);do 
    local lnk=$HOME/$f
    local gitFile=${f:a}
    printf "[%s] Create symbolic link '%s' => '%s'." "${dot}" "${lnk}" "${gitFile}"
    _symbolicLink $lnk $gitFile
    local ret=$?
    ([[ $ret -eq 0 ]] && printf "[\033[0;32mOK\033[0m]\n") || ([[ $ret -eq 1 ]] && printf "[\033[0;31mERROR\033[0m]\n") || ([[ $ret -eq 2 ]] && printf "[\033[0;33mSKIP\033[0m]\n")
  ;done

  [[ ! -a ${DOTFILESDIR:-$HOME/dotfiles}/modules/$dot/post-install-dotfiles.zsh ]] && continue
  printf "[%s] Source post-install-dotfiles script.\n" "${dot}" && source ${DOTFILESDIR:-$HOME/dotfiles}/modules/$dot/post-install-dotfiles.zsh
  popd > /dev/null

;done


