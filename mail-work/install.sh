source lib/brew.sh
source lib/dotfiles.sh

_installFormula offlineimap
_installFormula msmtp
_installFormula alot
_installFormula w3m
_installFormula urlview
_installFormula notmuch


_syncMyDotFiles mail-work/files

echo "Decrypt notmuch post hook to tag emails"
keybase decrypt -i ~/Mail/.notmuch/hooks/post-new.keybase -o ~/Mail/.notmuch/hooks/post-new 
chmod u+x ~/Mail/.notmuch/hooks/post-new

echo "Decrypt alot search by tag file"
keybase decrypt -i ~/.config/alot/search.txt.keybase -o ~/.config/alot/search.txt

echo "Import new emails"
notmuch new