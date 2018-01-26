#! /usr/bin/env python2
from subprocess import check_output

def get_pass():
    return check_output("pass Users/marko/Library/Keychains/marko.keychain/Apps/offlineimap", shell=True).splitlines()[0]

