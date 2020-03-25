local install_command

icmd=(sudo)
if grep ID /etc/os-release | grep -qE "fedora"; then
  icmd+=(dnf)
  icmd+=(install)
elif grep ID /etc/os-release | grep -q void; then
  icmd+=(xbps-install)
else 
  echo "Sorry, we don't recognize your OS."
  exit 1
fi

zstyle -a ":dotfiles:install" app apps

printf "Install aps from the given modules '%s'\n" "${apps}"
read "con?Do you want to continue? (y/n)"
[[ "$con" =~ ^[Yy]$ ]] || exit 1

for a in "$apps[@]";do
  printf "Installing '%s'...\n" "${a}"
  "${icmd[@]}" ${a}
done


