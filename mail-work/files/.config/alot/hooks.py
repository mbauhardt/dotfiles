#! /usr/bin/env python2

def searchByTag():
  file = open("/Users/mb/.config/alot/search.txt", "r")
  s = file.read()
  file.close()
  ui.apply_commandline(s)
