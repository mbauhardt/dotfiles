#!/usr/pkg/bin/fish

set -q DOT_CONFIG_DIR || set DOT_CONFIG_DIR $XDG_CONFIG_DIR/dotfiles
set -q DOT_FILES_DIR || set DOT_FILES_DIR $HOME/.local/src/github.com/mbauhardt/dotfiles
if test -f "$DOT_CONFIG_DIR/.dotfilesrc"
  source "$DOT_CONFIG_DIR/.dotfilesrc"
end

function _help 
  printf "Help\n"
end

function _installDotfiles
  printf "Install Dotfiles\n"
  source $DOT_FILES_DIR/lib/install_dotfiles.fish
end

function _cleanDotfiles
  printf "Clean Dotfiles\n"
  source $DOT_FILES_DIR/lib/clean_dotfiles.fish
end

if test (count $argv) -eq 0
  _help
  exit 0
end

argparse --name=dotfiles 'h/help' 'i/install-dotfiles' 'r/remove-dotfiles' -- $argv
if not test $status -eq 0
  exit 1
end

if test (count $_flag_h) -eq 1
  _help
else if test (count $_flag_i) -eq 1
  _installDotfiles
else if test (count $_flag_r) -eq 1
  _cleanDotfiles
end

