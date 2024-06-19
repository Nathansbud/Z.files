_BGG=(
	"$PERSONAL_DIR"/BGGCLI/venv/bin/python3 
	"$PERSONAL_DIR"/BGGCLI/bgg.py
)
_QUICKTEXT=("$PERSONAL_DIR"/Quicktext/text.py)
_MATH=("$PERSONAL_DIR"/PythonNonsense/Calculator/calculator.py)

function bgg() { $_BGG $@ }
function text() { python3 $_QUICKTEXT $@ }
function math() { python3 -i $_MATH}