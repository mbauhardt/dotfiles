zstyle -a ":dotfiles:load" dmodules dots
printf "Delete all symblic links from the given modules '%s'\n" "${dots}"
read "con?Do you want to continue? (y/n)"
[[ "$con" =~ ^[Yy]$ ]] || exit 1

for dot in "$dots[@]";do 

  # -v verbose
  # -R recursive
  # -t target
  stow -v -R -d ${DOTFILESDIR:-$HOME/dotfiles}/dots -t $HOME -D $dot

;done


