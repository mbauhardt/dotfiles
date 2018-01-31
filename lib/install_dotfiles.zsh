zstyle -a ":dotfiles:load" dmodules dots
printf "Link all files from the given modules '%s'\n" "${dots}"

for dot in "$dots[@]";do 
  
  [[ ! -d ${DOTFILESDIR:-$HOME/dotfiles}/modules/$dot/files ]] && continue
  pushd ${DOTFILESDIR:-$HOME/dotfiles}/modules/$dot/files > /dev/null
  for f in **/*(D.);do 
    local lnk=$HOME/$f
    local gitFile=${f:a}
    [[ -a $lnk ]] && printf "[%s] File '%s' already exist.\n" "${dot}" "${lnk}" && continue
    printf "[%s] Create symbolic link '%s' => '%s'.\n" "${dot}" "${lnk}" "${gitFile}"
    mkdir -p ${lnk:h}
    ln -s ${gitFile} $lnk 
  ;done
  [[ ! -a ${DOTFILESDIR:-$HOME/dotfiles}/modules/$dot/post-install-dotfiles.zsh ]] && continue
  printf "[%s] Source post-install-dotfiles script.\n" "${dot}" && source ${DOTFILESDIR:-$HOME/dotfiles}/modules/$dot/post-install-dotfiles.zsh
  popd > /dev/null

;done


