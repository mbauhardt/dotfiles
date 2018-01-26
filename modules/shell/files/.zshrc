
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin:$PATH"

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="mbauhardt"
plugins=(git gradle zsh-autosuggestions z pass taskwarrior zsh-interactive-cd fz) 

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=8

unset SSH_AGENT_PID
export SSH_AUTH_SOCK=~/.gnupg/S.gpg-agent.ssh

export ANT_OPTS="-Xmx2048m -XX:MaxPermSize=512m"

export EDITOR="nvim"
alias e="nvim"

export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


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


export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

function setupIdeaForDM() {
  echo "Clean Workspace"
  ./gradlew clean $@ || return;
  echo "Setup Hadoop..."
  ./gradlew setupHadoop $@ || return;
  echo ""
  echo "Compile Integration Tests..."
  ./gradlew compileIntegTest $@ || return;
  echo""
  echo "Generate Idea Project Files..."
  ./gradlew idea $@ || return;
}
