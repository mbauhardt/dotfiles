zstyle -a ":dotfiles:load" dmodules dots
printf "Link all files from the given modules '%s'\n" "${dots}"
read "con?Do you want to continue? (y/n)"
[[ "$con" =~ ^[Yy]$ ]] || exit 1

for dot in "$dots[@]";do 

  # -v verbose
  # -R recursive
  # -t target
  stow --ignore 'post-install-dotfiles.zsh' --ignore 'post-install-software.zsh' --ignore 'install-software.zsh' -v -R -t $HOME -d ${DOTFILESDIR:-$HOME/dotfiles}/dots $dot

  [[ ! -a ${DOTFILESDIR:-$HOME/dotfiles}/dots/$dot/post-install-dotfiles.zsh ]] && continue
  printf "[%s] Source post-install-dotfiles script.\n" "${dot}" && source ${DOTFILESDIR:-$HOME/dotfiles}/dots/$dot/post-install-dotfiles.zsh

;done


