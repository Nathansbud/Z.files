alias restart="exec $SHELL -l"
alias copy="pbcopy"

# System preference nonsense
alias sysp='open -a "System Preferences"'
alias finder='open -R $1'
alias allow='(){xattr -d com.apple.quarantine $1}'

# Daemon / Agent logic
alias agents="launchctl list | grep nathansbud"
alias daemons="sudo launchctl list | grep nathansbud"

# ls aliases
alias la="ls -A"
function lsd() {
	ls -d -- */
}

# Quick kill commands
alias dechrome="pkill -f 'Google Chrome'; pkill -f 'chromedriver'"
alias denode="pkill -f 'node'"
