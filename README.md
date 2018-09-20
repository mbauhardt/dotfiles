# dotfiles
My personal dotfiles

* Install brew

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

* This project is using homebrew to install software. SO it could make sense to define HOMEBREW_CASK_OPTS params like

    export HOMEBREW_CASK_OPTS="--appdir=/opt"

* Versions

    brew tap caskroom/cask
    brew tap caskroom/versions

* Install openzfs via brew 

    brew cask install openzfs

* mount all available zfs datasets

    sudo zfs mount -l -a

* Install keybase via brew and provision your device

    brew cask install keybase

* set zsh as default shell

    chsh -s /bin/zsh

* export DOTFILESDIR if `dotfiles` are cloned into another directoty than `~/dotfiles`

    export DOTFILESDIR=${ZDOTDIR:-$HOME}/z/src/dotfiles/master

* copy the file `.dotfilesrc.template` to `~/.dotfilesrc` and define the set of modules you want to load 

    zstyle ":dotfiles:load" dmodules 'privacy' 'system' 'bookmarks' 'chat' 'dev' 'gtd' 'mail-work' 'neovim' 'shell' 'desktop' 'internet' 

Attention `privacy` must be the first module because there are some sensitive data which are encrypted with `keybase`. those files will be decrypted within the installation process.
`system` should be the second one. because the installer uses also `git` to install software. 
 
