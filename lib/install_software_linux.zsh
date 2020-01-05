
zstyle -a ":dotfiles:load" dnf apps


printf "Install RPMs from the given modules '%s'\n" "${apps}"
read "con?Do you want to continue? (y/n)"
[[ "$con" =~ ^[Yy]$ ]] || exit 1

for app in "$apps[@]";do 

  printf "Install rpm '%s'.\n" "${app}"
  sudo dnf install $app

;done


