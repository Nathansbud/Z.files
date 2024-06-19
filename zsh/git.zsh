alias clone='(){git clone $1 && cd $(basename $_ .git)}'
alias gs="git status"
alias gds="git diff --staged"
alias branch="git rev-parse --abbrev-ref HEAD"
alias github="hub browse > /dev/null 2>&1 || open 'https://github.com/Nathansbud' -a 'Google Chrome'"

alias gm="git diff --name-only --diff-filter=U --relative"
alias gr="git diff --check"

alias ignore-changes="git update-index --skip-worktree $@"