alias se="deactivate &> /dev/null"
alias p="ipython3"

function sv() {
    if [[ -z $1 ]] then
        source venv/bin/activate;
    else
        source "$1/bin/activate";
    fi
}
