print "Initialize Notmuch Address Cache"
$DOTFILESDIR/submodules/notmuch-address-cache/bin/notmuch-address-cache rebuild --text

print "Decrypt notmutch post new hook"
keybase decrypt -i ~/z/documents/mail/.notmuch/hooks/post-new.keybase -o ~/z/documents/mail/.notmuch/hooks/post-new

