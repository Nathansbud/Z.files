_TF=("$PERSONAL_DIR"/TuningFork)

_TUNINGFORK=(
	"$_TF"/venv/bin/python3 
	"$_TF"/enqueue.py
)

_MANAGER=(
    "$_TF"/venv/bin/python3
    "$_TF"/manager.py
)

_LYRICS=(
	"$_TF"/venv/bin/python3 
	"$_TF"/lyrics.py
)

# TuningFork Aliases
function q()   { $_TUNINGFORK -st $@ }
function qw()  { $_TUNINGFORK -w }
function qq()  { $_TUNINGFORK -q }
function qn()  { $_TUNINGFORK -n $@ }
function qs()  { $_TUNINGFORK --save $@ }
function qp()  { $_TUNINGFORK --playpause }
function ql()  { $_TUNINGFORK -l $@ }
function qa()  { for v ($@) $_TUNINGFORK $v }
function qc()  { $_TUNINGFORK -st $@ --share }
function qca() { $_TUNINGFORK -st $@ --share APPLE }
function qrl() { $_TUNINGFORK -x LIBRARY -# -1 $@ }    
function qrb() { $_TUNINGFORK -x BACKLOG -# -1 $@ }
function qtm() { $_TUNINGFORK $@ --share --text mahlon }

function ft() { $_MANAGER }
function ft-form() { $_MANAGER --musook }
function ft-backlog() { $_MANAGER --backlog }
function ft-prune() { $_MANAGER --prune }

# Lyrics Aliases
function lyrics() { 
    paths=$($_LYRICS $@);
    code=$?   
    if [[ $code == 0 ]] then
        echo $paths | xargs less;
        
        # For safety sake, we do NOT do this anymore lol
        # echo $paths | xargs rm;
    else
        echo $paths;
    fi
}

