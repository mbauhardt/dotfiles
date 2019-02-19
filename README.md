# dotfiles
My personal dotfiles

## Installation

export DOTFILESDIR if `dotfiles` are cloned into another directoty than `~/dotfiles`

    export DOTFILESDIR=${ZDOTDIR:-$HOME}/z/src/dotfiles/master

checkout dotfiles project

    git clone --recursive git@github.com:mbauhardt/dotfiles.git "${DOTFILESDIR:-$HOME}/z/src/dotfiles/master"

## Setup
Install brew

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

This project is using homebrew to install software. SO it could make sense to define HOMEBREW_CASK_OPTS params like

    export HOMEBREW_CASK_OPTS="--appdir=/opt"

Special Homebrew Taps e.g. Versions

    brew tap caskroom/cask
    brew tap caskroom/versions

Install keybase via brew and provision your device

    brew cask install keybase

set zsh as default shell

    chsh -s /bin/zsh

export DOTFILESDIR if `dotfiles` are cloned into another directoty than `~/dotfiles`

    export DOTFILESDIR=${ZDOTDIR:-$HOME}/z/src/dotfiles/master

copy the file `.dotfilesrc.template` to `~/.dotfilesrc` and define the set of modules you want to load 

    zstyle ":dotfiles:load" dmodules 'privacy' 'bookmarks' 'chat' 'dev' 'gtd' 'mail-work' 'neovim' 'zsh' 'shell-utils' 'desktop' 'internet' 
    # or the minimum version
    zstyle ":dotfiles:load" dmodules 'privacy' 'zsh' 'shell-utils'

Attention `privacy` must be the first module because there are some sensitive data which are encrypted with `keybase`. those files will be decrypted within the installation process.
`system` should be the second one. because the installer uses also `git` to install software. 

## Usage

To install dotfiles execute

    bin/dotfiles --install-dotfiles

To remove all dotfiles

    bin/dotfiles --clean-dotfiles

To install software execute

    bin/dotfiles --install-software

