source lib/brew.sh
source lib/dotfiles.sh

_installFormula offlineimap
_installFormula msmtp
_installFormula alot
_installFormula w3m
_installFormula urlview
_installFormula notmuch


_syncMyDotFiles mail/files

notmuch new
