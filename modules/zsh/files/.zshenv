# .zshenv is sourced on all invocations of the shell, unless the -f option is set.
# It should contain commands to set the command search path, plus other important environment variables.
# It should not contain commands that produce output or assume the shell is attached to a tty.

path=(
  /usr/local/{bin,sbin}
  $HOME/bin
  $path
)

fpath=(
  $HOME/.zsh/functions
  $fpath
)

######################
#      DOTFILES      #
######################

export DOTFILESDIR=${ZDOTDIR:-$HOME}/z/src/dotfiles/master
export HOMEBREW_CASK_OPTS="--appdir=/opt"


#####################
#     GPG/SSH       #
#####################

unset SSH_AGENT_PID
export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh


#####################
#     PASSWORDS     #
#####################

export PASSWORD_STORE_DIR=~/z/documents/passwords
export PASSWORD_STORE_ENABLE_EXTENSIONS=true


export LANG='en_US.UTF-8'
