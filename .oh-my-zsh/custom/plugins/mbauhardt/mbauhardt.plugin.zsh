ZSH_THEME="mbauhardt"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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


#export NVM_DIR="/Users/marko/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
