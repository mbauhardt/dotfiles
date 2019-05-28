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
  #subprocess.call("offlineimap -o".split(),stdout=subprocess.PIPE,stderr=subprocess.PIPE)

def enc(userid):
  e = ui.current_buffer.envelope
  msg = e.body
  try:
      e.body = subprocess.check_output(['keybase', 'encrypt', '-m', '"'+
msg +'"', userid], stderr=subprocess.STDOUT)
  except Exception as e:
      ui.notify('Failure while encryption:' + str(e), priority='error')
  else:
      ui.notify('Encryption done...')

  ui.current_buffer.rebuild()
  
