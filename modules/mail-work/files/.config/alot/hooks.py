#! /usr/bin/env python2

import logging
import subprocess

async def searchByTag():
  file = open("/Users/mb/.config/alot/search.txt", "r")
  s = file.read()
  file.close()
  await ui.apply_commandline(s)


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
  
