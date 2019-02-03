# `.zlogin' is sourced in login shells. It should contain commands that should be executed only in login shells.
# `.zlogin' is not the place for alias definitions, options, environment variable settings, etc.
# as a general rule, it should not change the shell environment at all.
# Rather, it should be used to set the terminal type and run a series of external commands (fortune, msgs, etc).

# login, interactive:  .zshenv -> .zprofile -> .zshrc -> .zlogin

echo 'zlogin'

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
#   COMPLETION  #
#################

compinit_dump="$HOME/.zcompdump"
autoload -Uz compinit
if [[ ! -r ${compinit_dump} || -n ${compinit_dump}(#qN.mh+24) ]]; then
  echo 'Initialize compinit...'
  rm -f "$compinit_dump"
  compinit -d "$compinit_dump"
  zcompile "$compinit_dump"
else
  compinit -C -d "$compinit_dump"
fi;

