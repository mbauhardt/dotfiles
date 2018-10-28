print  "Decrypt notmuch post hook to tag emails.\n"
keybase decrypt -i ~/z/documents/mail/.notmuch/hooks/post-new.keybase -o ~/z/documents/mail/.notmuch/hooks/post-new
chmod u+x ~/z/documents/mail/.notmuch/hooks/post-new

print "Decrypt alot search by tag file.\n"
keybase decrypt -i ~/.config/alot/search.txt.keybase -o ~/.config/alot/search.txt

print "Initialize Notmuch Address Cache"
notmuch-address-cache rebuild --json

