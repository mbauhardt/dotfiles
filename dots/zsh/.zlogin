# `.zlogin' is sourced in login shells. It should contain commands that should be executed only in login shells.
# `.zlogin' is not the place for alias definitions, options, environment variable settings, etc.
# as a general rule, it should not change the shell environment at all.
# Rather, it should be used to set the terminal type and run a series of external commands (fortune, msgs, etc).

# login, interactive:  .zshenv -> .zprofile -> .zshrc -> .zlogin

export TERM=xterm-256color

#################
#      FASD     #
#################

# - '#q' is an explicit glob qualifier that makes globbing work within zsh's [[ ]] construct.
# - 'N' makes the glob pattern evaluate to nothing when it doesn't match (rather than throw a globbing error)
# 'mh+24' matches files (or directories or whatever) that are older than 24 hours.
if [[ ! -r ${fasd_cache} || -n ${fasd_cache}(#qN.mh+24) ]]; then
  echo 'Initialize fasd...'
  fasd --init auto > "$fasd_cache"
  source "$fasd_cache"
fi;



#################
#     TMUX      #
#################

if [[ -z "$TMUX" ]]; then
  tmux has-session 2>/dev/null
  if [[ "$?" -eq 1 ]]; then
    echo "Attach new tmux sessions..."
    tmux new-session -d -s dev -c "$HOME/z/src/dap/master" -n topics
    tmux new-session -d -s etc
    tmux new-session -d -s home -n vim
    tmux new-window -t home:1 -n mail
    tmux new-window -t home:2 -n todos
    tmux new-window -c "$HOME/z/src/dap/master" -t dev:1 -n master
    tmux new-window -c "$HOME/z/src/dap/v7.5" -t dev:2 -n v7.5
    tmux new-window -c "$HOME/z/src/dap/v7.4" -t dev:3 -n v7.4
    tmux select-window -t dev:1
  fi
fi
