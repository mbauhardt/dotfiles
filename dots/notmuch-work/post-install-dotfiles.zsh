print "Initialize Notmuch Address Cache"
#$DOTFILESDIR/submodules/notmuch-address-cache/bin/notmuch-address-cache rebuild --text

print "Decrypt notmutch post new hook"
#keybase decrypt -i ~/var/mail/datameer.com/.notmuch/hooks/post-new.keybase -o ~/var/mail/datameeer.com/.notmuch/hooks/post-new

