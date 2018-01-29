zstyle ":mbauhardt:dotfiles:load" dmodules 'gtd' 'dev' 'neovim'

zstyle -a ":mbauhardt:dotfiles:load" dmodules dots
printf "Link all files from the given modules '%s'\n" "${dots}"

for dot in "$dots[@]";do 
  
  pushd modules/$dot/files > /dev/null
  for f in **/*(D.);do 
    printf "[%s] Link file '%s' to '%s'\n" "${dot}" "${f:t}" "${HOME}/${f}"
  ;done
  print -l
  popd > /dev/null

;done


