source lib/brew.sh
source lib/dotfiles.sh

_installFormula libdvdcss
_installFormula pass
_installFormula gpg2
_installFormula yubikey-personalization

_syncMyDotFiles privacy/files

chmod 700 ~/.gnupg 
