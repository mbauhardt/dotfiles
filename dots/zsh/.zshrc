# `.zshrc' is sourced in interactive shells. It should contain commands to set up aliases, functions, options, key bindings, etc.

# login, interactive: .zshenv -> .zprofile -> .zshrc -> .zlogin
# non-login, interactive: .zshenv -> .zshrc


#########################
#       FUNCTIONS       #
#########################

autoload -Uz tm     # list tmux sessions
autoload -Uz backup_personal_files     # backup my personal files
autoload -Uz mm     # shortcut for mail overview based on notmuch tags
autoload -Uz m     # shortcut for mail incl notmuch tags
autoload -Uz mq     # query notmuch database
autoload -Uz jira-sprint-overview     # colored sprint overview


#########################
#       BASIC           #
#########################

setopt no_beep
setopt auto_cd
setopt complete_in_word
#setopt correct
setopt rm_star_wait
eval `dircolors`


#########################
#     NAMED DIRS        #
#########################

#setopt auto_name_dirs
hash -d MY_DOTS=$DOTFILESDIR
hash -d DAP_MASTER=$HOME/usr/src/dap/master
hash -d DAP_V74=$HOME/usr/src/dap/v7.4
hash -d DAP_V72=$HOME/usr/src/dap/v7.2
hash -d HADOOP=$HOME/usr/local/hadoop/hadoop-2.6.0
hash -d HIVE_11=$HOME/usr/local/hadoop/hive-1.1.0
hash -d HIVE_12=$HOME/usr/local/hadoop/hive-1.2.1
hash -d PASSWORDS=$HOME/.password-store


#########################
#         ZLE           #
#########################

bindkey -v    # vim mode
export KEYTIMEOUT=1    # delay after hit ESC


#########################
#       COMPLETION      #
#########################

setopt EXTENDEDGLOB #if the EXTENDEDGLOB option is set, some new features are activated e.g. file(#qN.mh+24)
autoload -Uz compinit
compinit_dump="$HOME/.zcompdump"
# - '#q' is an explicit glob qualifier that makes globbing work within zsh's [[ ]] construct.
# - 'N' makes the glob pattern evaluate to nothing when it doesn't match (rather than throw a globbing error)
# 'mh+24' matches files (or directories or whatever) that are older than 24 hours.
if [[ ! -r ${compinit_dump} || -n ${compinit_dump}(#qN.mh+24) ]]; then
  echo 'Initialize compinit...'
  rm -f "$compinit_dump"
  compinit -d "$compinit_dump"
  zcompile "$compinit_dump"
else
  compinit -C -d "$compinit_dump"
fi;

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

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

alias e='$EDITOR'


#########################
#       FILESYTEM       #
#########################


alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ls='ls --color=auto'
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

alias gw="./gradlew"
alias scala="scala -Dscala.shell.histfile=$HOME/z/documents/histories/scala_history"
alias hive_1_1="HADOOP_HOME=\"/home/mb/hadoop/hadoop-2.6.0\" HADOOP_USER_CLASSPATH_FIRST=true HADOOP_CLIENT_OPTS=\"-Duser.home=$HOME/z/documents/histories\" bin/hive"
alias beeline_1_1="HADOOP_HOME=\"/home/mb/hadoop/hadoop-2.6.0\" HADOOP_USER_CLASSPATH_FIRST=true HADOOP_CLIENT_OPTS=\"-Duser.home=$HOME/z/documents/histories\" bin/beeline"
alias gwf='./gradlew validate findbugsMain'
#export JAVA_HOME=/usr/lib/jvm/java-1.8.0
#export JAVA_HOME=/usr/lib/jvm/java-11
export N_PREFIX=$HOME/usr/local


#########################
#        MAIL           #
#########################

# show and navigation
#alias m="mscan | tac"
alias mt="mthread | m"
alias mu="mseq -C .+1; m"
alias md="mseq -C .-1; m"
alias ml="mseq -C \$; m"
alias mf="mseq -C 1; m"

# general mail search queries
alias m_unread="mq 'tag:unread'"
alias m_sent="mq 'tag:sent and date:60d..'"
alias m_inbox="mq 'tag:inbox and date:31d..'"
#alias m_me="mq 'tag:to-me and date:14d..'"
alias m_flagged="mq 'tag:flagged'"
alias m_spam="mq 'tag:spam and date:31d..'"
alias m_trash="mq 'tag:deleted and date:31d..'"
alias m_all="mq 'date:30d..'"

# special search queries
source $HOME/.zsh/aliases/mblaze

#########################
#       HISTORY         #
#########################

HISTFILE=$HOME/.zhistory
SAVEHIST=10000
HISTSIZE=12000
setopt inc_append_history
setopt extended_history
setopt hist_reduce_blanks
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt share_history

export MYSQL_HISTFILE=~/z/documents/histories/mysql_history


#########################
#      ZSH-USERS        #
#########################
source $DOTFILESDIR/submodules/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

source $DOTFILESDIR/submodules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main cursor line)
ZSH_HIGHLIGHT_STYLES[line]='bold'
ZSH_HIGHLIGHT_STYLES[cursor]='bg=blue'

source $DOTFILESDIR/submodules/zsh-history-substring-search/zsh-history-substring-search.zsh
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
[ -f /usr/share/fzf/shell/key-bindings.zsh ] && source /usr/share/fzf/shell/key-bindings.zsh
[ -f /usr/share/doc/fzf/key-bindings.zsh ] && source /usr/share/doc/fzf/key-bindings.zsh


#########################
#         XDG           #
#########################

[[ ! -d $XDG_RUNTIME_DIR ]] && mkdir -p $XDG_RUNTIME_DIR && chmod 0700 $XDG_RUNTIME_DIR


#########################
#      GNUPG / SSH      #
#########################

GPG_TTY=$(tty)
export GPG_TTY
unset SSH_AGENT_PID
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"


#########################
#       PROMPT          #
#########################

autoload -Uz promptinit && promptinit
prompt pure
# jobs
PROMPT='%(1j.[%j] .)% '$PROMPT

function zle-line-init zle-keymap-select {
	# Change the cursor style depending on keymap mode.
	case $KEYMAP {
		vicmd)
			printf '\e[0 q' # Box.
			;;

		viins|main)
			printf '\e[6 q' # Vertical bar.
			;;
	}
}

zle -N zle-line-init
zle -N zle-keymap-select

