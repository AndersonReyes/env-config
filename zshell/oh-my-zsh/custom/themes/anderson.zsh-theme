NEWLINE=$'\n'
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='%{$fg[cyan]%}dir:%c%{$reset_color%} $(git_prompt_info) $(git_commits_ahead) $(git_commits_behind)${NEWLINE}${ret_status}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}%{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%} %{$fg[green]%}✔"
ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX="%{$fg[yellow]%}"
ZSH_THEME_GIT_COMMITS_BEHIND_PREFIX="%{$fg[yellow]%}"
ZSH_THEME_GIT_COMMITS_BEHIND_SUFFIX="↓"
ZSH_THEME_GIT_COMMITS_AHEAD_SUFFIX="↑"

