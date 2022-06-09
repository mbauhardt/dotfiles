set dots 'msmtp' 'isync'
echo "Link all files from the given modules: '$dots'"
echo "Do you want to continue? (y/n)"
read con
test "$con" = "y" || exit 1

for d in $dots 

  echo $DOT_FILES_DIR
  # -v verbose
  # -R recursive
  # -t target
  stow --ignore 'post-install-dotfiles.zsh' --ignore 'post-install-software.zsh' --ignore 'install-software.zsh' -v -R -t  $HOME -d $DOT_FILES_DIR/dots $d

  #[[ ! -a ${DOTFILESDIR:-$HOME/dotfiles}/dots/$d/post-install-dotfiles.zsh ]] && continue
  #printf "[%s] Source post-install-dotfiles script.\n" "${d}" && source ${DOTFILESDIR:-$HOME/dotfiles}/dots/$d/post-install-dotfiles.zsh
end


