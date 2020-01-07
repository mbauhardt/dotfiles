# dotfiles
My personal dotfiles

## Convenient Folders

    mkdir -p $HOME/z/{documents,src,share}
    mkdir -p $HOME/z/documents/{etc,gnupg,histories,mail,passwords,pdf,vim,vimwiki}

## Steps before doing the Installations

    sudo dnf install zsh
    sudo chsh -s $(which zsh)
    sudo dnf install stow
    sudo dnf install keybase
    run_keybase
    sudo dnf install git
    sudo dnf install gnupg2

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

Configure your the dotfiles you want to symlink via `.dotfilesrc` file. See [.dotfilesrc.template](.dotfilesrc.template)


## Usage

To install dotfiles execute

    bin/dotfiles --install-dotfiles

To remove all dotfiles

    bin/dotfiles --clean-dotfiles

To install software execute

    bin/dotfiles --install-software



## Steps afterwards

    # afew software to index mails
    mkdir ~/venvs
    python -m venv --system-site-packages ~/venvs/mail
    source ~/venvs/mail/bin/activate
    pip install --upgrade pip
    pip install afew

    # mblaze
    cd submodules/mblaze
    make all
    sudo make instal

    # mblaze-much
    cd submodules/mblaze-much
    make vendor-mblaze
    make binaries
    sudo cp bin/mtags /usr/local/bin/

    # brave browser
    sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
    sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
    sudo dnf install brave-browser


