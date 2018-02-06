zstyle -a ":dotfiles:load" dmodules dots
printf "Delete all symblic links from the given modules '%s'\n" "${dots}"

for dot in "$dots[@]";do 

  [[ ! -d ${DOTFILESDIR:-$HOME/dotfiles}/modules/$dot/files ]] && continue
  pushd ${DOTFILESDIR:-$HOME/dotfiles}/modules/$dot/files > /dev/null
  for f in **/*(D.);do 
    local lnk=$HOME/$f
    local gitFile=${f:a}
    [[ ! -h $lnk ]] && printf "[%s] File '%s' is not a symbolic link.\n" "${dot}" "${lnk}" && continue
    printf "[%s] Delete symbolic link '%s'.\n" "${dot}" "${lnk}" 
    rm $lnk 
  ;done
  popd > /dev/null

;done


