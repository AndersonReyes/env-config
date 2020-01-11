[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export CLICOLOR=1
export TERM=xterm-256color
export VISUAL=vim
export EDITOR="$VISUAL"
export PATH=$PATH:$HOME/.cargo/bin
export KUBE_EDITOR=vim

goto() {
    local dir
    dir=~/projects
    DIR=`find $dir/* -maxdepth 1 -type d -print 2> /dev/null | fzf-tmux` && cd "$DIR";
}

export PS1='\[\e[32m\]\W/ \[\e[35m\] \[\e[m\]
> '

export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
source <(kubectl completion bash)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/andersonreyes/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/andersonreyes/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/andersonreyes/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/andersonreyes/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


export GOBIN="$GOPATH/bin"
export PATH="$HOME/.poetry/bin:$GOBIN:$PATH"
