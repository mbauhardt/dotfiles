print  "Decrypt notmuch post hook to tag emails.\n"
keybase decrypt -i ~/Mail/.notmuch/hooks/post-new.keybase -o ~/Mail/.notmuch/hooks/post-new
chmod u+x ~/Mail/.notmuch/hooks/post-new

print "Decrypt alot search by tag file.\n"
keybase decrypt -i ~/.config/alot/search.txt.keybase -o ~/.config/alot/search.txt

print "Import new emails.\n"
notmuch new

