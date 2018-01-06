source lib/brew.sh
source lib/dotfiles.sh

_installFormula sbt
_installFormula scala
_installFormula gradle
_installFormula maven
_installFormula git
_installFormula mysql

_syncMyDotFiles dev/files
