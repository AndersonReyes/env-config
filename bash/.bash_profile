#!/bin/bash
#
# DESCRIPTION:
#
#   Set the bash prompt according to:
#    * the active virtualenv
#    * the branch/status of the current git repository
#    * the return value of the previous command
#    * the fact you just came from Windows and are used to having newlines in
#      your prompts.
#
# USAGE:
#
#   1. Save this file as ~/.bash_prompt
#   2. Add the following line to the end of your ~/.bashrc or ~/.bash_profile:
#        . ~/.bash_prompt
#
# LINEAGE:
#
#   Based on work by woods
#
#   https://gist.github.com/31967

# The various escape codes that we can use to color our prompt.
        RED="\[\033[0;31m\]"
     YELLOW="\[\033[1;33m\]"
      GREEN="\[\033[0;32m\]"
       BLUE="\[\033[1;34m\]"
  LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
      WHITE="\[\033[1;37m\]"
 LIGHT_GRAY="\[\033[0;37m\]"
 COLOR_NONE="\[\e[0m\]"
 CYAN="\[\033[0;36m\]"
 MAGENTA="\[\033[0;35m\]"


 # Detect whether the current directory is a git repository.
function is_git_repository {
  git branch > /dev/null 2>&1
}

# Determine the branch/state information for this git repository.
function set_git_branch {
  # Capture the output of the "git status" command.
  git_status="$(git fetch 2> /dev/null; git status 2> /dev/null)"

  # Set color based on clean/staged/dirty.
  if [[ ${git_status} =~ "nothing to commit" ]]; then
    state="${GREEN}✓"
  elif [[ ${git_status} =~ "Changes to be committed" ]]; then
    state="${YELLOW}◎"
  else
    state="${LIGHT_RED}●"
  fi

  # Set arrow icon based on status against remote.
  ahead_pattern="Your branch is ahead"
  behind_pattern="Your branch is behind"
  remote=""
  if [[ ${git_status} =~ ${ahead_pattern} ]]; then
    remote+="↑"
  fi

  if [[ ${git_status} =~ ${behind_pattern} ]]; then
    remote+="↓"
  fi

  # Get the name of the branch.
  branch="\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)"

  # Set the final branch string.
  BRANCH="${branch} ${state} ${CYAN}${remote}${COLOR_NONE} "
}

# Return the prompt symbol to use, colorized based on the return value of the
# previous command.
function set_prompt_symbol () {
  if test $1 -eq 0 ; then
      PROMPT_SYMBOL="λ"
  else
      PROMPT_SYMBOL="${LIGHT_RED}λ${COLOR_NONE}"
  fi
}

# Determine active Python virtualenv details.
function set_virtualenv () {
  if test -z "$VIRTUAL_ENV" ; then
      PYTHON_VIRTUALENV=""
  else
      PYTHON_VIRTUALENV="${BLUE}[`basename \"$VIRTUAL_ENV\"`]${COLOR_NONE} "
  fi
}

# Set the full bash prompt.
function set_bash_prompt () {
  # Set the PROMPT_SYMBOL variable. We do this first so we don't lose the
  # return value of the last command.
  set_prompt_symbol $?

  # Set the PYTHON_VIRTUALENV variable.
  set_virtualenv

  # Set the BRANCH variable.
  if is_git_repository ; then
    set_git_branch
  else
    BRANCH=''
  fi

  # Set the bash prompt variable.
  PS1="
${PYTHON_VIRTUALENV}${MAGENTA}\W${COLOR_NONE} ${BRANCH}
${PROMPT_SYMBOL} "
}

# Tell bash to execute this function just before displaying its prompt.
PROMPT_COMMAND=set_bash_prompt

alias so-bash='source ~/.bash_profile'
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bash_profile'

# Set color alias for mac laptop
platform="$(uname -s)"

if [[ ${platform} =~ "Darwin" ]]; then
    alias ls='ls -GH'
fi

export PATH=/Users/andersonreyes/Library/Python/2.7/bin:$PATH
export PATH="$HOME/.cargo/bin:$PATH"
