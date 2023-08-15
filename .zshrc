# Path to your oh-my-zsh installation.
export ZSH="/Users/zackamiton/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

#[PLUGIN VARS]
plugins=(
    git
    git-open 
)
source $ZSH/oh-my-zsh.sh

#[ENV]
HISTORY_IGNORE='(history)'

# -- [Utilities] -- 
alias restart="exec $SHELL -l"
alias config="open ~/.zshrc"
alias sysp='open -a "System Preferences"'
alias allow='(){xattr -d com.apple.quarantine $1}'

alias agents="launchctl list | grep nathansbud"
alias daemons="sudo launchctl list | grep nathansbud"

alias la="ls -A"
alias lsd="ls -d -- */"

alias dechrome="pkill -f 'Google Chrome'; pkill -f 'chromedriver'"
alias denode="pkill -f 'node'"

# Quickpaths
alias inkscape="/Applications/Inkscape.app/Contents/MacOS/inkscape"
alias math="python3 -i /Users/zackamiton/Code/PythonNonsense/Calculator/calculator.py"  

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load all our lovely config files
_CONFIG_PATH=(/Users/zackamiton/Code/Zdot/zsh)
for config ($_CONFIG_PATH/*.zsh) source $config
