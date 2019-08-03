ZSH_THEME="robbyrussell"
plugins=(
    zsh-autosuggestions
    zsh-syntax-highlighting
    colored-man-pages
    colorize
    kubectl
    helm
)

alias lsvirtualenv='lsvirtualenv -b'
alias kci='kubectl cluster-info'
alias cat=bat
alias preview="fzf --preview 'bat --color 'always' {}'"
alias vim=nvim

export ZSH="/Users/andersonreyes/.oh-my-zsh"
export VIRTUAL_ENV_DISABLE_PROMPT=0
export VISUAL=nvim
export EDITOR="$VISUAL"
export PATH=$PATH:$HOME/.cargo/bin
export KUBE_EDITOR=nvim

source $ZSH/oh-my-zsh.sh
source ~/.bash_profile
source <(kubectl completion zsh)

PROMPT='%{$fg[cyan]%}%c%{$reset_color%} > %{$reset_color%}'
ZSH_THEME_VIRTUALENV_PREFIX="%{$fg_bold[cyan]%}venv(%{$fg[magenta]%}"
ZSH_THEME_VIRTUALENV_SUFFIX="%{$fg_bold[cyan]%})%{$reset_color%}"
eval "$(pyenv init -)"
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
export WORKON_HOME=$HOME/.virtualenvs
pyenv virtualenvwrapper_lazy

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
