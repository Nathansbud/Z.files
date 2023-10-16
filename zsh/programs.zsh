_BGG=(
	/Users/zackamiton/Code/BGGCLI/venv/bin/python3 
	/Users/zackamiton/Code/BGGCLI/bgg.py
)
_QUICKTEXT=(/Users/zackamiton/Code/Quicktext/text.py)
_MATH=(/Users/zackamiton/Code/PythonNonsense/Calculator/calculator.py)

function bgg() { $_BGG $@ }
function text() { python3 $_QUICKTEXT $@ }
function math() { python3 -i $_MATH}