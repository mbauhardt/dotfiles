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

export GNUPGHOME=$HOME/z/documents/gnupg


#####################
#     PASSWORDS     #
#####################

export PASSWORD_STORE_DIR=~/z/documents/passwords
export PASSWORD_STORE_ENABLE_EXTENSIONS=true
export BORG_PASSCOMMAND="pass show Users/mb/Library/Keychains/datameer.keychain/Notes/borg"


# needed for alot
export LANG='en_US.UTF-8'
export LC_ALL=en_US.UTF-8
export MBLAZE=$HOME/.mblaze
export BROWSER=brave-browser

# dev
export GOPATH=$HOME/z/src/go

# XDG
: ${XDG_CONFIG_HOME:="$HOME/.config"}
: ${XDG_CACHE_HOME:="$HOME/.cache"}
: ${XDG_DATA_HOME:="$HOME/.local/share"}
: ${XDG_RUNTIME_DIR:="/tmp/$UID"}
export XDG_CONFIG_HOME XDG_CACHE_HOME XDG_DATA_HOME XDG_RUNTIME_DIR

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

