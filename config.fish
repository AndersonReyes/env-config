set -x TERM "xterm-256color"
set -x PATH $HOME/.cargo/bin:$HOME/bin:/usr/local/bin:$HOME/miniconda3/bin:$PATH
set -x VISUAL vim
set -x EDITOR "$VISUAL"
set -x PATH $PATH:/usr/local/go/bin
set -x GOPATH /home/anderson/golib
set -x PATH $PATH:$GOPATH/bin
set -x GOPATH $GOPATH:/home/anderson/Projects/golang


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/anderson/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

