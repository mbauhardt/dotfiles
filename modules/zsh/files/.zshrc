# `.zshrc' is sourced in interactive shells. It should contain commands to set up aliases, functions, options, key bindings, etc.


# login, interactive: .zshenv -> .zprofile -> .zshrc -> .zlogin
# non-login, interactive: .zshenv -> .zshrc

#########################
#       FUNCTIONS       #
#########################

autoload -Uz tm     # list tmux sessions


#########################
#       BASIC           #
#########################

setopt no_beep
setopt auto_cd
setopt complete_in_word
#setopt correct
setopt rm_star_wait
eval `gdircolors`


#########################
#         ZLE           #
#########################

bindkey -v    # vim mode
export KEYTIMEOUT=1    # delay after hit ESC


#########################
#       COMPLETION      #
#########################

zmodload -i zsh/complist
zstyle ':completion:*' verbose yes       # show comments for options if available
zstyle ':completion:*' group-name ''     # group completion hits by category
zstyle ':completion:*:descriptions' format '%S%d%s'     # show description of category in reverse video color
zstyle ':completion:*:corrections' format '%S%d%s'
zstyle ':completion:*:messages' format '%S%d%s'
zstyle ':completion:*:warnings' format '%S%d%s'
zstyle ':completion:*' menu select=2     # activate menu completion if zsh found more than 2 hits
zstyle ':completion:*:default' select-prompt '%SMatch %M %P%s'     # show status bar for a lot of hits
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}     # show files and folders in different colors
zstyle ':completion:*' completer _complete _correct _approximate     # enable approximation e.g.: ld_sma[TAB] will be completed to my alias ls_small
zstyle ':completion:*:approximate:*' max-errors 2
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'     # ignore case



#########################
#       EDITOR          #
#########################

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

alias e='$EDITOR'

#########################
#       FILESYTEM       #
#########################

setopt EXTENDEDGLOB #if the EXTENDEDGLOB option is set, some new features are activated e.g. file(#qN.mh+24)

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ls='gls --color=auto'
alias l='ls -lh'         # Lists human readable sizes
alias ll='ls -lhA'       # Lists human readable sizes, hidden files
alias ls_big='ls -Slh | head'
alias ls_small='ls -Slhr | head'
alias ls_new='ls -tlh | head'
alias ls_old='ls -tlh | tail'

#########################
#        GIT            #
#########################

alias g='git'
alias gst='git status'
alias gws='git status --short'
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
setopt auto_name_dirs

export MYSQL_HISTFILE=~/z/documents/histories/mysql_history


#########################
#      ZSH-USERS        #
#########################
source $DOTFILESDIR/modules/zsh/submodules/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

source $DOTFILESDIR/modules/zsh/submodules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main cursor line)
ZSH_HIGHLIGHT_STYLES[line]='bold'
ZSH_HIGHLIGHT_STYLES[cursor]='bg=blue'

source $DOTFILESDIR/modules/zsh/submodules/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=magenta,fg=white,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=white,bold'
HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS='i'
HISTORY_SUBSTRING_SEARCH_FUZZY='f'

#########################
#       FZF & FASD      #
#########################

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fasd_cache="$HOME/.fasd-cache"
[ -r ${fasd_cache} ] && source $fasd_cache


#########################
#      BASE 16 SHELL    #
#########################

# FIXME: base16 colors slows down the statup. think about to use colors via iTerm 
# or switch to suckless terminal where I can compile the color into
BASE16_SHELL=$DOTFILESDIR/modules/zsh/submodules/base16-shell
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && eval "$("$BASE16_SHELL/profile_helper.sh")"


#########################
#       PROMPT          #
#########################

autoload -Uz promptinit && promptinit
prompt pure
MY_DOTS=$DOTFILESDIR
DAP_MASTER=$HOME/z/src/dap/master
DAP_V74=$HOME/z/src/dap/v7.4
DAP_V72=$HOME/z/src/dap/v7.2
PROMPT='%(?.%F{white}%* %% .%F{red}%? %F{white}%* %%%f '

function zle-line-init zle-keymap-select {
    RPROMPT="%F{yellow}${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}%f"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

