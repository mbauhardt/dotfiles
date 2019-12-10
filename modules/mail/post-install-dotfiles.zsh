print  "Decrypt afew config to tag emails.\n"
keybase decrypt -i ~/.config/afew/config.keybase -o ~/.config/afew/config
chmod u+x ~/z/documents/mail/.notmuch/hooks/post-new

