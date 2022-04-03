empty() {
  echo ""
}

prompt_indicator() {
   echo $'%B\u276f%b'
}

username() {
   echo "%n"
}

directory() {
   echo "%2~"
}

current_time() {
   echo "%{$fg[white]%}%*%{$reset_color%}"
}

git_prompt() {
  if [[ "$(git_prompt_info)" == "" ]]; then
    echo ""
  else
    echo "[$(git_prompt_info)]$(git_prompt_status)"
  fi
}

# Set the git_prompt_info text
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Set the git_prompt_status text
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} +%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ~%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} x%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} #%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ^%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[white]%} *%{$reset_color%}"

PROMPT='$(directory) $(git_prompt)
$(prompt_indicator) '
