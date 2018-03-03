_deleteDotfiles() {
  local lnk=$1
  [[ ! -h $lnk ]] &&  return 2;
  rm $lnk
  return $?
}

zstyle -a ":dotfiles:load" dmodules dots
printf "Delete all symblic links from the given modules '%s'\n" "${dots}"

for dot in "$dots[@]";do 

  [[ ! -d ${DOTFILESDIR:-$HOME/dotfiles}/modules/$dot/files ]] && continue
  pushd ${DOTFILESDIR:-$HOME/dotfiles}/modules/$dot/files > /dev/null
  for f in **/*(D.);do 
    local lnk=$HOME/$f
    printf "[%s] Delete symbolic link '%s'." "${dot}" "${lnk}"
    _deleteDotfiles $lnk
    local ret=$?
    ([[ $ret -eq 0 ]] && printf "[\033[0;32mOK\033[0m]\n") || ([[ $ret -eq 1 ]] && printf "[\033[0;31mERROR\033[0m]\n") || ([[ $ret -eq 2 ]] && printf "[\033[0;33mSKIP\033[0m]\n")
  ;done
  popd > /dev/null

;done


