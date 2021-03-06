export HOMEBREW_NO_AUTO_UPDATE=1
export TERM="xterm-256color"
export VISUAL=vim
export EDITOR="$VISUAL"
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# get current branch in git repo
function parse_git_branch() {
        BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
        if [ ! "${BRANCH}" == "" ]
        then
                STAT=`parse_git_dirty`
                echo " [${BRANCH}${STAT}]"
        else
                echo ""
        fi
}

# get current status of git repo
function parse_git_dirty {
        status=`git status 2>&1 | tee`
        dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
        untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
        ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
        newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
        renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
        deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
        bits=''
        if [ "${renamed}" == "0" ]; then
                bits="!"
        fi
        if [ "${ahead}" == "0" ]; then
                bits="!"
        fi
        if [ "${newfile}" == "0" ]; then
                bits="!"
        fi
        if [ "${untracked}" == "0" ]; then
                bits="!"
        fi
        if [ "${deleted}" == "0" ]; then
                bits="!"
        fi
        if [ "${dirty}" == "0" ]; then
                bits="!"
        fi

        if [ ! "${bits}" == "" ]; then
                echo "${bits}"
        else
                echo ""
        fi
}

[-f ~/.fzf.bash ] && source ~/.fzf.bash

export PS1="\W\`parse_git_branch\` 🍺 "
