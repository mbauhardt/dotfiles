print "Decrypt alot search by tag file.\n"
keybase decrypt -i ~/.config/alot/search.txt.keybase -o ~/.config/alot/search.txt
keybase decrypt -i ~/.config/afew/config.keybase -o ~/.config/afew/config

print "Initialize Notmuch Address Cache"
notmuch-address-cache rebuild --json

