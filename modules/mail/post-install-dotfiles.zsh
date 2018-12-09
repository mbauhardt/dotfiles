print  "Decrypt notmuch post hook to tag emails.\n"
keybase decrypt -i ~/z/documents/mail/.notmuch/hooks/post-new.keybase -o ~/Mail/.notmuch/hooks/post-new
chmod u+x ~/z/documents/mail/.notmuch/hooks/post-new

