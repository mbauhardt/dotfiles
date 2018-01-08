#! /usr/bin/env python2

import logging
import subprocess

def searchByTag():
  file = open("/Users/mb/.config/alot/search.txt", "r")
  s = file.read()
  file.close()
  ui.apply_commandline(s)

def pre_global_refresh(**kwargs):
  logging.info('Syncing mail with offlineimap')
  ui.notify("fetchinig email..")  
  subprocess.call("offlineimap -o".split(),stdout=subprocess.PIPE,stderr=subprocess.PIPE)
