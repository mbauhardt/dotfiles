#! /usr/bin/env python3
from subprocess import check_output


def get_pass():
    return check_output("pass Users/mb/Library/Keychains/datameer.keychain/Apps/offline_imap", shell=True).splitlines()[0]
