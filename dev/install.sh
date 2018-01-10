#!/usr/bin/env sh

source lib/brew.sh
source lib/dotfiles.sh

_installFormula sbt
_installFormula scala
_installFormula gradle
_installFormula maven
_installFormula git
_installFormula mysql
_installFormula jenv

_syncMyDotFiles dev/files

for f in /Library/Java/JavaVirtualMachines/*; do
  jenv add $f/Contents/Home
done


jenv enable-plugin maven
jenv enable-plugin sbt
jenv enable-plugin scala
jenv enable-plugin ant
jenv enable-plugin gradle
jenv enable-plugin export

