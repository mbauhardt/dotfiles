# `.zshrc' is sourced in interactive shells. It should contain commands to set up aliases, functions, options, key bindings, etc.


# login, interactive: .zshenv -> .zprofile -> .zshrc -> .zlogin
# non-login, interactive: .zshenv -> .zshrc

echo 'zshrc'

#########################
#       FILESYTEM       #
#########################

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias l='ls -lh'         # Lists human readable sizes
alias ll='ls -lhA'       # Lists human readable sizes, hidden files

#########################
#        GIT            #
#########################

alias g='git'
alias gst='git status'
alias gco='git checkout'
alias gia='git add'
alias gb='git branch'
alias gc='git commit --verbose'
alias gf='git fetch'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gr='git rebase'
alias gP='git push'
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"


#########################
#       TASK            # 
#########################

alias t='task'

#########################
#     DEVELOPMENT       #
#########################

alias scala="scala -Dscala.shell.histfile=$HOME/z/documents/histories/scala_history"
alias hive_1_1="HADOOP_HOME=\"/opt/hadoop-2.6.0\" HADOOP_USER_CLASSPATH_FIRST=true HADOOP_CLIENT_OPTS=\"-Duser.home=$HOME/z/documents/histories\" bin/hive"
alias beeline_1_1="HADOOP_HOME=\"/opt/hadoop-2.6.0\" HADOOP_USER_CLASSPATH_FIRST=true HADOOP_CLIENT_OPTS=\"-Duser.home=$HOME/z/documents/histories\" bin/beeline"
alias ktutil=/usr/local/Cellar/krb5/1.16.1/bin/ktutil
alias gw='./gradlew'
alias gwf='./gradlew validate findbugsMain'

#########################
#       HISTORY         #
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


#########################
#    AUTOSUGGESTIONS    #
#########################
source $DOTFILESDIR/modules/zsh/submodules/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'

#########################
#        FZF            #
#########################

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
