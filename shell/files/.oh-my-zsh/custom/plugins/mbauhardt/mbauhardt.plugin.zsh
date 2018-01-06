ZSH_THEME="mbauhardt"
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

setjdk 1.8
export PATH=$HOME/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=7

unset SSH_AGENT_PID
export SSH_AUTH_SOCK=~/.gnupg/S.gpg-agent.ssh

export ANT_OPTS="-Xmx2048m -XX:MaxPermSize=512m"

alias setupIdeaForDM='./gradlew clean createPluginXml compileIntegTest pluginZipCopy jobJar'

export EDITOR="vim"

export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm


export TERM=screen-256color
export LC_ALL=en_US.UTF-8

if [ -z "$TMUX" ]; then
  if tmux has-session 2>/dev/null; then
    tmux attach
  else
    tmux new-session -d -s WORK
    tmux new-window -t WORK -n MAIL
    tmux new-window -t WORK -n SLACK
    tmux new-window -t WORK -n BOOKMARKS
    tmux new-window -t WORK -n WIKI
    tmux new-window -t WORK -n DAEMONS
    tmux a -t WORK
  fi
fi

