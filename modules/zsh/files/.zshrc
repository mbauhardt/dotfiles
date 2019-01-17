# `.zshrc' is sourced in interactive shells. It should contain commands to set up aliases, functions, options, key bindings, etc.


# login, interactive: .zshenv -> .zprofile -> .zshrc -> .zlogin
# non-login, interactive: .zshenv -> .zshrc

echo 'zshrc'


#########################
#    HISTORY SETTINGS   #
#########################

HISTFILE=$HOME/z/documents/histories/z_history
SAVEHIST=10000
HISTSIZE=12000
setopt inc_append_history
setopt extended_history
setopt hist_reduce_blanks
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt share_history

