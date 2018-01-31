print  "Decrypt notmuch post hook to tag emails.\n"
keybase decrypt -i ~/Mail/.notmuch/hooks/post-new.keybase -o ~/Mail/.notmuch/hooks/post-new
chmod u+x ~/Mail/.notmuch/hooks/post-new

print "Import new emails.\n"
notmuch new

