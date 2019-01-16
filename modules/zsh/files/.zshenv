# .zshenv is sourced on all invocations of the shell, unless the -f option is set.
# It should contain commands to set the command search path, plus other important environment variables.
# It should not contain commands that produce output or assume the shell is attached to a tty.

echo 'zshenv'

path=(
  /usr/local/{bin,sbin}
  $HOME/bin
  $path
)

fpath=(
  $HOME/.zsh/functions
  $fpath
)

export LANG='en_US.UTF-8'
export DOTFILESDIR=${ZDOTDIR:-$HOME}/z/src/dotfiles/master

