zstyle ":dotfiles:load" dmodules 'gtd' 'dev' 'neovim'

zstyle -a ":dotfiles:load" dmodules dots
printf "Link all files from the given modules '%s'\n" "${dots}"

for dot in "$dots[@]";do 
  
  pushd ${DOTFILESDIR:-$HOME/dotfiles}/modules/$dot/files > /dev/null
  for f in **/*(D.);do 
    local lnk=$HOME/$f
    local gitFile=${f:a}
    [[ -a $lnk ]] && printf "[%s] File '%s' already exist.\n" "${dot}" "${lnk}" && continue
    printf "[%s] Create symbolic link '%s' => '%s'.\n" "${dot}" "${lnk}" "${gitFile}"
    ln -s ${gitFile} $lnk 
  ;done
  popd > /dev/null

;done


