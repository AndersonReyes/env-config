NEWLINE=$'\n'
local ret_status="%(?:%{$fg_bold[green]%}> :%{$fg_bold[red]%}> )"
PROMPT='%{$fg_bold[blue]%}%c%{$reset_color%} $(git_prompt_info) ${ret_status}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✔"
