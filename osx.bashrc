export VISUAL=nvim
export EDITOR="$VISUAL"
export KUBE_EDITOR=nvim
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
export WORKON_HOME=$HOME/.virtualenvs

alias lsvirtualenv='lsvirtualenv -b'
alias preview="fzf --preview 'bat --color 'always' {}'"
alias vim=nvim

# helper functions most of these rely on fzf
parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		echo "[${BRANCH}]"
	else
		echo ""
	fi
}

k8s_ns() {
    local ns
    ns=$(kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null)
    echo "$ns"
}

k8s_ctx() {
    local ctx
    ctx=$(kubectl config current-context)
    echo "$ctx"
}

goto() {
    local dir
    dir=~/projects
    DIR=`find $dir/* -maxdepth 1 -type d -print 2> /dev/null | fzf-tmux` && cd "$DIR";
}

# fbr - checkout git branch (including remote branches), sorted by most recent commit, limit 30 last branches
fbr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

k8s() {
    echo $'\u2388'
}

eval "$(pyenv init -)"
pyenv virtualenvwrapper_lazy

printf "\e[?2004l"
export PS1="""\[\e[32m\]\W\[\e[m\] \[\e[33m\]\`parse_git_branch\`\[\e[m\] \[\e[34m\]$(k8s)\[\e[m\] \
\[\e[36m\]$(k8s_ctx):$(k8s_ns)\[\e[m\]
> """

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
source <(kubectl completion bash)
