source brew.sh
source ohmyzsh.sh
source dotfiles.sh
source tools.sh

_installOhMyZsh
_installZshAutosuggestions
_installTmuxThemepack
_installBrew
_installFormulas
_patchZshrc
_updateDotFiles

echo ""
read -p "Do you wanna really sync your dotfiles from git?  This may overwrite existing dotfiles in your home directory. Are you sure? (y/n) " -n 1;
echo ""
[[ $REPLY =~ ^[Yy]$ ]] && echo "Start to sync dotfiles." && _syncMyDotFiles
