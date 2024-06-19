export HOME_DIR=("")
export PERSONAL_DIR=("")
export WORK_DIR=("")

# Load all our lovely config files
export _SETUP_CONFIG_PATH=($HOME_DIR/.autogen-config)
export _PERSONAL_CONFIG_PATH=($WORK_DIR/files/zsh)
export _WORK_CONFIG_PATH=($PERSONAL_DIR/D.files/)

for config (
  $_SETUP_CONFIG_PATH/*.zsh
  $_PERSONAL_CONFIG_PATH/*.zsh 
  $_WORK_CONFIG_PATH/*.zsh
) source $config