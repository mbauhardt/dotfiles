# `.zprofile' is meant as an alternative to `.zlogin' for ksh fans; the two are not intended to be used together, although this could certainly be done if desire.
# similar to .zlogin but will be sourced before .zshrc. Note that, both .zprofile and .zshrc are skipped in non-login non-interactive shells.

# login, interactive: .zshenv -> .zprofile -> .zshrc -> .zlogin

echo 'zprofile'


