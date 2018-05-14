NEWLINE=$'\n'
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='%{$fg_bold[magenta]%}$USER %{$fg[cyan]%}dir(%c)%{$reset_color%} $(git_super_status) ${NEWLINE}${ret_status}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[yellow]%}git(%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[yellow]%})"
ZSH_THEME_GIT_PROMPT_SEPARATOR=""
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_STAGED=" %{$fg[white]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS=" %{$fg[red]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED=" %{$fg[green]%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND=" %{$fg[yellow]%}%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$fg[yellow]%}%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}%{✔%G%}"
RPROMPT=''
