alias se="deactivate &> /dev/null"
alias p="ipython3"

function sv() {
    if [[ -z $1 ]] then
        source venv/bin/activate;
    else
        source "$1/bin/activate";
    fi
}

# Default to using pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)" 
