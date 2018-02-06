
precmd() { print "" }

ZSH_PROMPT_PREFIX="%{$fg_bold[cyan]%}"
ZSH_PROMPT_SUFFIX="%{$reset_color%}"

#sha
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=
ZSH_THEME_GIT_PROMPT_SHA_AFTER=

ZSH_THEME_GIT_PROMPT_AHEAD="DOWN"
ZSH_THEME_GIT_PROMPT_BEHIND="UP"

ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_DETAILED="yes"
ZSH_THEME_GIT_PROMPT_EQUAL_REMOTE=
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE=$(echo -e "\xE2\x86\x91")
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE_COLOR="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE=$(echo -e "\xE2\x86\x93")
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE_COLOR="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_PREFIX=" # "
ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_SUFFIX=


PROMPT='%{$fg_bold[white]%}%n@%m:%{$fg_bold[yellow]%}%~%{$reset_color%} $(my_git_prompt)
[%w, %T] %? %# '


function my_git_prompt() {
  local ref
  ref=$(git_current_branch)
  if [[ -n $ref ]]; then
    echo -n $ZSH_PROMPT_PREFIX"git:("$ref%{$fg_bold[red]%}$(parse_git_dirty)%{$reset_color%}%{$fg_bold[cyan]%} "#" $(git_prompt_short_sha)$(git_remote_status)")"$ZSH_PROMPT_SUFFIX
  fi
}

