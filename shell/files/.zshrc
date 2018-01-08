
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin:$PATH"

export ZSH=/Users/mb/.oh-my-zsh
ZSH_THEME="mbauhardt"
plugins=(git gradle zsh-autosuggestions z pass taskwarrior zsh-interactive-cd fz) 

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

alias java_ls='/usr/libexec/java_home -V 2>&1 | grep -E "\d.\d.\d[,_]" | cut -d , -f 1 | colrm 1 4 | grep -v Home'
function setjdk() {
  if [ $# -ne 0 ]; then
    removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
    if [ -n "${JAVA_HOME+x}" ]; then
      removeFromPath $JAVA_HOME
    fi
    export JAVA_HOME=`/usr/libexec/java_home -v $@`
    export PATH=$JAVA_HOME/bin:$PATH
  fi
  echo JAVA_HOME set to $JAVA_HOME
  java -version
 }

function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}

#setjdk 1.8

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=8

unset SSH_AGENT_PID
export SSH_AUTH_SOCK=~/.gnupg/S.gpg-agent.ssh

export ANT_OPTS="-Xmx2048m -XX:MaxPermSize=512m"

alias setupIdeaForDM='./gradlew clean createPluginXml compileIntegTest pluginZipCopy jobJar'

export EDITOR="nvim"
alias e="nvim"

export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm


export TERM=screen-256color
export LC_ALL=en_US.UTF-8

if [ -z "$TMUX" ]; then
  if tmux has-session 2>/dev/null; then
    echo "There are tmux sessions attached..."
  else
    tmux new-session -d -s MAIN
    tmux new-session -d -s KNOWLEDGE
    tmux new-window -t MAIN -n SLACK
    tmux new-window -t MAIN -n MAIL
    tmux new-window -t KNOWLEDGE -n BOOKMARKS
    tmux new-window -t KNOWLEDGE -n WIKI
  fi
fi

tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

