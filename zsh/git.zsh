alias clone='(){git clone $1 && cd $(basename $_ .git)}'
alias gs="git status"
alias github="hub browse > /dev/null 2>&1 || open 'https://github.com/Nathansbud' -a 'Google Chrome'"