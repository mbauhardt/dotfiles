setopt EXTENDED_GLOB
for rcfile in ${DOTFILESDIR:-$HOME/dotfiles}/modules/shell/externals/prezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

$(brew --prefix)/opt/fzf/install

