source lib/brew.sh
source lib/dotfiles.sh

_installFormula neovim
_syncMyDotFiles neovim/files

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

