# .zshenv is sourced on all invocations of the shell, unless the -f option is set.
# It should contain commands to set the command search path, plus other important environment variables.
# It should not contain commands that produce output or assume the shell is attached to a tty.


######################
#      DOTFILES      #
######################

export DOTFILESDIR=${ZDOTDIR:-$HOME}/z/src/dotfiles/master
export HOMEBREW_CASK_OPTS="--appdir=/opt"


#####################
#     GPG/SSH       #
#####################

unset SSH_AGENT_PID
export GNUPGHOME=$HOME/z/documents/gnupg
export SSH_AUTH_SOCK=$GNUPGHOME/S.gpg-agent.ssh


#####################
#     PASSWORDS     #
#####################

export PASSWORD_STORE_DIR=~/z/documents/passwords
export PASSWORD_STORE_ENABLE_EXTENSIONS=true


# needed for alot
export LANG='en_US.UTF-8'
export LC_ALL=en_US.UTF-8
export MBLAZE=$HOME/.mblaze

# dev
export GOPATH=$HOME/z/src/go

# export path and fpath
path=(
  /opt/usr/local/{bin,sbin}
  /usr/local/{bin,sbin}
  $HOME/bin
  $GOPATH/bin
  $path
)

fpath=(
  $HOME/.zsh/functions
  $fpath
)

