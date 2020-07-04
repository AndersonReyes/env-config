set -x TERM "xterm-256color"
set -x PATH $HOME/.cargo/bin:$HOME/bin:/usr/local/bin:$HOME/miniconda3/bin:$PATH
set -x VISUAL vim
set -x EDITOR "$VISUAL"
set -x PATH $PATH:/usr/local/go/bin
set -x GOPATH /home/anderson/golib
set -x PATH $PATH:$GOPATH/bin
set -x GOPATH $GOPATH:/home/anderson/Projects/golang
set -U fish_color_normal normal
set -U fish_color_command b294bb
set -U fish_color_quote b5bd68
set -U fish_color_redirection 8abeb7
set -U fish_color_end b294bb
set -U fish_color_error cc6666
set -U fish_color_param 81a2be
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_search_match bryellow --background=brblack
set -U fish_color_history_current --bold
set -U fish_color_operator 00a6b2
set -U fish_color_escape 00a6b2
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_valid_path --underline
set -U fish_color_autosuggestion 969896
set -U fish_color_user brgreen
set -U fish_color_host normal
set -U fish_color_cancel -r
set -U fish_pager_color_completion normal
set -U fish_pager_color_description B3A06D yellow
set -U fish_pager_color_prefix white --bold --underline
set -U fish_pager_color_progress brwhite --background=cyan
set -U fish_color_comment f0c674
set -U fish_color_match --background=brblue

#function fish_prompt
#    echo (basename (pwd)) '> '
#end

function fish_prompt
    set -l __last_command_exit_status $status

    if not set -q -g __fish_robbyrussell_functions_defined
        set -g __fish_robbyrussell_functions_defined
        function _git_branch_name
            set -l branch (git symbolic-ref --quiet HEAD 2>/dev/null)
            if set -q branch[1]
                echo (string replace -r '^refs/heads/' '' $branch)
            else
                echo (git rev-parse --short HEAD 2>/dev/null)
            end
        end

        function _is_git_dirty
            echo (git status -s --ignore-submodules=dirty 2>/dev/null)
        end

        function _is_git_repo
            type -q git
            or return 1
            git rev-parse --git-dir >/dev/null 2>&1
        end

        function _hg_branch_name
            echo (hg branch 2>/dev/null)
        end

        function _is_hg_dirty
            echo (hg status -mard 2>/dev/null)
        end

        function _is_hg_repo
            fish_print_hg_root >/dev/null
        end

        function _repo_branch_name
            _$argv[1]_branch_name
        end

        function _is_repo_dirty
            _is_$argv[1]_dirty
        end

        function _repo_type
            if _is_hg_repo
                echo 'hg'
                return 0
            else if _is_git_repo
                echo 'git'
                return 0
            end
            return 1
        end
    end

    set -l cyan (set_color -o cyan)
    set -l yellow (set_color -o yellow)
    set -l red (set_color -o red)
    set -l green (set_color -o green)
    set -l blue (set_color -o blue)
    set -l normal (set_color normal)

    set -l arrow_color "$green"
    if test $__last_command_exit_status != 0
        set arrow_color "$red"
    end

    set -l arrow "$arrow_color➜ "
    if test "$USER" = 'root'
        set arrow "$arrow_color# "
    end

    set -l cwd $cyan(basename (prompt_pwd))

    if set -l repo_type (_repo_type)
        set -l repo_branch $red(_repo_branch_name $repo_type)
        set repo_info "$blue $repo_type:($repo_branch$blue)"

        set -l dirty (_is_repo_dirty $repo_type)
        if test -n "$dirty"
            set -l dirty "$yellow ✗"
            set repo_info "$repo_info$dirty"
        end
    end

    echo -n -s $arrow ' '$cwd $repo_info $normal ' '
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/anderson/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
