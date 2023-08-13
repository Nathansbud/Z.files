# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/zackamiton/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

#[PLUGIN VARS]
plugins=(
    git
    git-open 
)
source $ZSH/oh-my-zsh.sh



# ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# not working rn idk why
# bindkey "^[^I" autocomplete-execute

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#[ENV]
HISTORY_IGNORE='(history)'

#[PATH ADDITIONS]

PATH="/Applications/CMake.app/Contents/bin":"$PATH"

#[EXPORTS]

export c="/Users/zackamiton/Code/"

#[ALIASES]

# -- [Utilities] -- 
alias restart="exec $SHELL -l"
alias config="open ~/.zshrc"
alias sysp='open -a "System Preferences"'

alias agents="launchctl list | grep nathansbud"
alias daemons="sudo launchctl list | grep nathansbud"

alias sv="source venv/bin/activate"
alias se="deactivate &> /dev/null"
alias p="ipython3"

alias la="ls -A"
alias lsd="ls -d -- */"
alias gs="git status"

alias dechrome="pkill -f 'Google Chrome'; pkill -f 'chromedriver'"
alias denode="pkill -f 'node'"

alias allow='(){xattr -d com.apple.quarantine $1}'
alias clone='(){git clone $1 && cd $(basename $_ .git)}'

alias github="hub browse > /dev/null 2>&1 || open 'https://github.com/Nathansbud' -a 'Google Chrome'"

# -- [Quick CDs] -- 
alias c="/Users/zackamiton/Code/"
alias s="/Users/zackamiton/Code/BrownCS"
alias site="/Users/zackamiton/Code/Zamiton/webapp"
alias cla="/Users/zackamiton/Library/LaunchAgents/"
alias cld="/Library/LaunchDaemons/"

# Program Paths
TUNINGFORK=(/Users/zackamiton/Code/TuningFork/venv/bin/python3 /Users/zackamiton/Code/TuningFork/enqueue.py)
LYRICS=(/Users/zackamiton/Code/TuningFork/venv/bin/python3 /Users/zackamiton/Code/TuningFork/lyrics.py)
BGG=(/Users/zackamiton/Code/BoredGamer/venv/bin/python3 /Users/zackamiton/Code/BoredGamer/bgg.py)

# Quickpaths
alias inkscape="/Applications/Inkscape.app/Contents/MacOS/inkscape"
alias math="python3 -i /Users/zackamiton/Code/PythonNonsense/Calculator/calculator.py"

# TuningFork Aliases
function q()   { $TUNINGFORK -st $@ }
function qw()  { $TUNINGFORK -w }
function qq()  { $TUNINGFORK -q }
function qn()  { $TUNINGFORK -n $@ }
function qs()  { $TUNINGFORK --save $@ }
function qp()  { $TUNINGFORK --playpause }
function qa()  { for v ($@) $TUNINGFORK $v }
function qc()  { $TUNINGFORK $@ --share }
function qca() { $TUNINGFORK $@ --share APPLE }
function qrl() { $TUNINGFORK -x LIBRARY -# -1 $@ }    
function qrb() { $TUNINGFORK -x BACKLOG -# -1 $@ }    

# Lyrics Aliases
function lyrics() { $LYRICS $@ | less; }
function ql() { $LYRICS }

# BGG Aliases
function bgg() { $BGG $@ }

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Credit: https://www.growingwiththeweb.com/2018/01/slow-nvm-init.html, modified to use whence (type not in zsh)
# Defer initialization of nvm until nvm, node or a node-dependent command is
# run. Ensure this block is only run once if .bashrc gets sourced multiple times
# by checking whether __init_nvm is a function.

if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(whence -w __init_nvm)" = function ]; then
 export NVM_DIR="$HOME/.nvm"
 [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
 declare -a __node_commands=(
   'nvm' 'node' 'npm' 'yarn' 'gulp' 'grunt' 'webpack' 
   # need to add aliases for npm-requiring commands
   'git open'
   )
 function __init_nvm() {
   for i in "${__node_commands[@]}"; do unalias $i; done
   . "$NVM_DIR"/nvm.sh
   unset __node_commands
   unset -f __init_nvm
 }
 for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
fi

# bring back "slower" NVM because dropdown console starts npm anyways at launch
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/zackamiton/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
   eval "$__conda_setup"
else
   if [ -f "/Users/zackamiton/miniconda3/etc/profile.d/conda.sh" ]; then
       . "/Users/zackamiton/miniconda3/etc/profile.d/conda.sh"
   else
       export PATH="/Users/zackamiton/miniconda3/bin:$PATH"
   fi
fi
unset __conda_setup
# <<< conda initialize <<<
