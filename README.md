# dotfiles
My personal dotfiles

## Convenient Folders

    mkdir -p $HOME/z/{documents,src,share}
    mkdir -p $HOME/z/documents/{etc,gnupg,histories,mail,passwords,pdf,vim,vimwiki}

## Linux Steps before doing the Installation

    sudo dnf install zsh
    sudo chsh -s $(which zsh)
    sudo dnf install stow
    sudo dnf install keybase
    run_keybase
    sudo dnf install git
    sudo dnf install gnupg2


## OSX Steps before doing the Installation (deprecated)

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    export HOMEBREW_CASK_OPTS="--appdir=/opt"
    brew tap caskroom/cask
    brew tap caskroom/versions
    brew cask install keybase
    chsh -s /bin/zsh


## Installation

    export DOTFILESDIR=${ZDOTDIR:-$HOME}/z/src/dotfiles/master
    git clone --recursive git@github.com:mbauhardt/dotfiles.git "${DOTFILESDIR:-$HOME}/z/src/dotfiles/master"
    cp ${DOTFILESDIR:-$HOME}/z/src/dotfiles/master/.dotfilesrc.template ~/.dotfilesrc

Configure your the dotfiles you want to symlink via `.dotfilesrc` file. See [.dotfilesrc.template](.dotfilesrc.template)


## Usage

    bin/dotfiles --install-dotfiles
    bin/dotfiles --clean-dotfiles
    bin/dotfiles --install-software


## Steps afterwards

    # remove colored emojis
    sudo dnf remove google-noto-emoji-color-fonts
    sudo dnf install google-noto-emoji-fonts

    # afew software to index mails
    mkdir ~/venvs
    python -m venv --system-site-packages ~/venvs/mail
    source ~/venvs/mail/bin/activate
    pip install --upgrade pip
    pip install afew

    # mblaze
    cd submodules/mblaze
    make all
    sudo make install

    # mblaze-much
    cd submodules/mblaze-much
    make vendor-mblaze
    make binaries
    sudo cp bin/mtags /usr/local/bin/

    # gmail calendar
    mkdir ~/venvs
    python -m venv --system-site-packages ~/venvs/calendar
    source ~/venvs/calendar/bin/activate
    pip install --upgrade pip
    pip install gcalcli
    pip install vobject

    # brave browser
    sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
    sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
    sudo dnf install brave-browser

    # suckless tools
    cd submodules/dwm
    make clean && make && sudo make install
    cd submodules/dmenu
    make clean && make && sudo make install
    cd submodules/st
    make clean && make && sudo make install
    cd submodules/slstatus
    make clean && make && sudo make install

    # qmk
    sudo usermod -aG dialout mb


    # docker
    vim /etc/default/grub
    #Append value of GRUB_CMDLINE_LINUX with systemd.unified_cgroup_hierarchy=0
    sudo grub2-mkconfig > /boot/efi/EFI/fedora/grub.cfg
    sudo reboot
    sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
    sudo dnf install docker-ce
    sudo systemctl enable --now docker
    sudo usermod -aG docker mb
    sudo reboot

    # minikube
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-1.6.2.rpm
    sudo rpm -ivh minikube-1.6.2.rpm
    egrep -q 'vmx|svm' /proc/cpuinfo && echo yes || echo no # should print out yes
    sudo dnf group install --with-optional virtualization
    sudo usermod -aG libvirt mb
    sudo systemctl start libvirtd
    sudo systemctl enable libvirtd
    lsmod | grep kvm  #should display something starting with `kvm`
    virt-host-validate  # validate libvirt
    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
    cp kubectl ~/bin # ~/bin has to be in your PATH
    chmod +x ~/bin/kubectl

    # bintray repo for sbt
    curl https://bintray.com/sbt/rpm/rpm > bintray-sbt-rpm.repo
    sudo mv bintray-sbt-rpm.repo /etc/yum.repos.d/
    sudo dnf install sbt

    # gcloud
    sudo tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
    [google-cloud-sdk]
    name=Google Cloud SDK
    baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el7-x86_64
    enabled=1
    gpgcheck=1
    repo_gpgcheck=1
    gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
           https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
    EOM
    sudo dnf install google-cloud-sdk

    # Visual Studio
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    sudo sh -c 'echo -e "[code]\nname=Visual Studio
    Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
    sudo dnf install code

    # nvidia
    sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
    sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    sudo dnf install akmod-nvidia
    sudo dnf remove xorg-x11-drv-nouveau
    # reboot and check intell is used per default
    xrandr --listproviders
    glxinfo | grep vendor 
    __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia glxinfo | grep vendor

    # sleep mode 
    vim /etc/default/grub
    GRUB_CMDLINE_LINUX_DEFAULT="mem_sleep_default=deep"
    grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg

    # power management !!! UNPPLUG LAPTOP FROM POWER !!!
    dnf install powertop tlp tuned-utils thermald
    systemctl start powertop
    systemctl enable powertop
    powertop --auto-tune
    systemctl enable tlp
    shutdown 0 -rf

    # Touchpad
    sudo vim /usr/share/X11/xorg.conf.d/40-libinput.conf
    # add the line `Option "NaturalScrolling" "True"` within the touchpad section
    # add the line `Option "ClickMethod" "clickfinger"` within the touchpad section

    # Resize lvm volume
    sudo lvs
    sudo lvextend --resizefs -L 100G /dev/mapper/fedora_fedorabox-root

Install other 3rd party software like
* Slack
* jetbrains-toolbox


