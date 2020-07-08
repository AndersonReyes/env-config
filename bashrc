export HOMEBREW_NO_AUTO_UPDATE=1
export PS1='\[\e[32m\]\W/ \[\e[m\]$ '
export TERM="xterm-256color"
export PATH=$HOME/.cargo/bin:$HOME/bin:/usr/local/bin:$HOME/miniconda3/bin:$PATH
export VISUAL=vim
export EDITOR="$VISUAL"
export PATH=$PATH:/usr/local/go/bin
export GOPATH=/home/anderson/golib
export PATH=$PATH:$GOPATH/bin
export GOPATH=$GOPATH:/home/anderson/Projects/golang

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

[ -f ~/.pym-envars ] && source ~/.pym-envars
[ -f ~/.fzf.bash ] && source ~/.fzf.bash


ssm_get_id () {
    local tag=$1
    local filters="[{\"Key\":\"AWS:Tag.Key\",\"Values\":[\"Name\"],\"Type\":\"Equal\"},{\"Key\":\"AWS:Tag.Value\",\"Values\":[\"$tag\"],\"Type\":\"Equal\"}]"
    aws ssm get-inventory --filters $filters  --output json | jq -r '.Entities[] | {id: .Id}'
}
