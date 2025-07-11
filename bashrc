export PS1="\w: "

export PATH="$PATH:/opt/nvim/"
export HOMELAB_DATA="$HOME/homelab"
export PATH="$PATH:/home/anderson/Programming/qbit-cli/prowlarr-client-bash"

alias pbcopy='xclip -sel clip'
alias pbpaste='xclip -sel clip -o'
alias rm="echo Use the full path i.e. '/bin/rm', consider using trash"
alias tre=transmission-remote
alias wtre='watch transmission-remote'
alias prowlarr-cli=/home/anderson/Programming/qbit-cli/prowlarr-client-bash/client.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
