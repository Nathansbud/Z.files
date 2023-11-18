_TUNINGFORK=(
	/Users/zackamiton/Code/TuningFork/venv/bin/python3 
	/Users/zackamiton/Code/TuningFork/enqueue.py
)

_LYRICS=(
	/Users/zackamiton/Code/TuningFork/venv/bin/python3 
	/Users/zackamiton/Code/TuningFork/lyrics.py
)

# TuningFork Aliases
function q()   { $_TUNINGFORK -st $@ }
function qw()  { $_TUNINGFORK -w }
function qq()  { $_TUNINGFORK -q }
function qn()  { $_TUNINGFORK -n $@ }
function qs()  { $_TUNINGFORK --save $@ }
function qp()  { $_TUNINGFORK --playpause }
function qa()  { for v ($@) $_TUNINGFORK $v }
function qc()  { $_TUNINGFORK -st $@ --share }
function qca() { $_TUNINGFORK -st $@ --share APPLE }
function qrl() { $_TUNINGFORK -x LIBRARY -# -1 $@ }    
function qrb() { $_TUNINGFORK -x BACKLOG -# -1 $@ }
function qtm() { $_TUNINGFORK $@ --share --text mahlon }

# Lyrics Aliases
function lyrics() { 
    paths=$($_LYRICS $@);
    code=$?   
    if [[ $code == 0 ]] then
        echo $paths | xargs less;
        echo $paths | xargs rm;
    else
        echo $paths;
    fi
}

function ql() { $_LYRICS }
