### SETUP PREAMBLE ###
NOT() { 
    case "$1" in 
        true) echo false;;
        false) echo true;;
    esac
}

UUID() { 
  dscl . -read ~ GeneratedUID | sed 's/GeneratedUID: //'
}

DISABLED=false

## Styling Nonsense ## 
RED() { echo "\033[31m$@\033[0m"; }
YELLOW() { echo "\033[33m$@\033[0m"; }
BLUE() { echo "\033[1;34m$@\033[0m";}

### CONFIGURATION VARIABLES ###
DEBUG=true
NOT_DEBUG=$(NOT $DEBUG)

SSH_PATH="$HOME_DIR/.ssh/autokey"
GIT_NAME="Zack Amiton"
GIT_EMAIL="zamiton@outlook.com"

echo "Welcome to Zetup! The following script will install most everything a Zack needs on a new laptop."
echo
echo "Critical external actions, $(YELLOW 'indicated in yellow'), must be completed for the remainder of setup to work."
echo "Suggested external actions, $(BLUE 'indicated in blue'), could be completed, but will not actively impact setup if returned to later."
echo

SLEEP_COUNTER=5
if $NOT_DEBUG; then
    
    echo "Beginning in $(RED $SLEEP_COUNTER)..."
    sleep 1

    while [ $SLEEP_COUNTER -ge 2 ]
    do
        SLEEP_COUNTER=$(( $SLEEP_COUNTER - 1 ))
        echo "$(RED $SLEEP_COUNTER)..."
        sleep 1
    done
    echo
fi


CONF_DIR=$(dirname $(realpath "$0"))
ZSH_DIR="$CONF_DIR/zsh"

if $DEBUG; then
    DEBUG_DIR="$CONF_DIR/_debug"
    
    [ ! -d "_trash" ] && mkdir "$CONF_DIR/_trash"
    [ -d "$DEBUG_DIR" ] && mv "$DEBUG_DIR" "$CONF_DIR/_trash/_debug-$(date +%s)"

    mkdir "$DEBUG_DIR"
    HOME_DIR="$CONF_DIR/_debug"
else
    HOME_DIR="$CONF_DIR/_debug"
fi

PERSONAL_DIR="$HOME_DIR/Personal"
WORK_DIR="$HOME_DIR/Work"

echo "Creating Work + Personal directories..."
mkdir "$PERSONAL_DIR" "$WORK_DIR"

echo "Initializing standard configs (zsh, vim, git)..."

# Vim Setup
cp "$CONF_DIR/.vimrc" "$HOME_DIR/.vimrc"

# Zsh Setup
cp "$CONF_DIR/.zshrc" "$HOME_DIR/.zshrc"
# sed -i '' "s|^_PERSONAL_CONFIG_PATH=\(.*\)$|_PERSONAL_CONFIG_PATH=\($ZSH_DIR\)|" "$HOME_DIR/.zshrc"

sed -i '' "s|^export HOME_DIR=\(.*\)$|export HOME_DIR=\($HOME_DIR\)|" "$HOME_DIR/.zshrc"
sed -i '' "s|^export WORK_DIR=\(.*\)$|export WORK_DIR=\($WORK_DIR\)|" "$HOME_DIR/.zshrc"
sed -i '' "s|^export PERSONAL_DIR=\(.*\)$|export PERSONAL_DIR=\($PERSONAL_DIR\)|" "$HOME_DIR/.zshrc"

# Git Setup
find "$CONF_DIR"/git -type f -print0 | while IFS= read -r -d '' gitfile; do    
    cp "$gitfile" "$HOME_DIR/$(basename "$gitfile")"
done

# SSH Setup
echo "Generating SSH key and $(RED copying to clipboard)..."
[ ! -d "$HOME_DIR/.ssh" ] && mkdir "$HOME_DIR/.ssh"

ssh-keygen -t ed25519 -C "$SSH_EMAIL" -N "" -f "$HOME_DIR/.ssh/autokey" &> /dev/null

eval "$(ssh-agent -s)" &> /dev/null
$NOT_DEBUG && ssh-add --apple-use-keychain "$HOME_DIR/.ssh/autokey"

pbcopy < "$HOME_DIR/.ssh/autokey.pub"

echo
echo "$(YELLOW 'Add this key to GitHub'), as future actions require the ability to clone via SSH [$(YELLOW 'done? ↵')]"
$NOT_DEBUG && read

TUNINGFORK_DIR="$PERSONAL_DIR/TuningFork"
BGGCLI_DIR="$PERSONAL_DIR/BGGCLI"
KEY_DIR="$PERSONAL_DIR/Custom-Keyboards"

echo "Setting up TuningFork..."
git clone git@github.com:Nathansbud/TuningFork.git "$TUNINGFORK_DIR" &> /dev/null
find "$CONF_DIR"/resources/TuningFork -type f -print0 | while IFS= read -r -d '' tf; do    
    cp "$tf" "$TUNINGFORK_DIR/resources/$(basename "$tf")"
done
# TODO: Build venv for TuningFork

echo "$(BLUE 'Generate credentials files (Spotify, Last.fm)') to be able to use TuningFork [$(YELLOW done? ↵)]"
$NOT_DEBUG && read


echo "Setting up BGGCLI..."
git clone git@github.com:Nathansbud/BoredGamer.git "$BGGCLI_DIR" &> /dev/null
# TODO: Build venv for BGGCLI

echo "Setting up Super Cute..."
git clone git@github.com:Nathansbud/Custom-Keyboards.git "$KEY_DIR" &> /dev/null

if $DISABLED; then
    cp "$KEY_DIR/Super Cute.keylayout" "$HOME_DIR/Library/Input Methods/Super Cute.keylayout"
    # TODO: Figure out how to get keyboard layout automatically added in macOS preferences
else
    echo "$(RED 'Super Cute setup is disabled'); manually add the .keylayout to Input Methods!"
fi

if $DISABLED; then
    CORE_BRIGHTNESS="/var/root/Library/Preferences/com.apple.CoreBrightness.plist"
    USER_KEY="CBUser-$(UUID)"

    NIGHT_SHIFT_TARGET='{
        CBBlueLightReductionCCTTargetRaw = 2700;
        CBBlueReductionStatus =         {
            AutoBlueReductionEnabled = 1;
            BlueLightReductionDisableScheduleAlertCounter = 3;
            BlueLightReductionSchedule =             {
                DayStartHour = 5;
                DayStartMinute = 59;
                NightStartHour = 6;
                NightStartMinute = 0;
            };
            BlueReductionAvailable = 1;
            BlueReductionEnabled = 1;
            BlueReductionMode = 2;
            BlueReductionSunScheduleAllowed = 1;
            Version = 1;
        };
    }'
    
    sudo defaults write "$CORE_BRIGHTNESS" "CBUser-0" "$NIGHT_SHIFT_TARGET"
    sudo defaults write "$CORE_BRIGHTNESS" "$USER_KEY" "$NIGHT_SHIFT_TARGET"

    # Correctly updates plist file, but doesn't seem to actually work as expected, deeply frustrating;
    # restarting/killall on cfprefsd, window server, ... also does not affect things.
    
    # Might need to hit the CoreBrightness framework directly to get changes to actually propogate?
    # e.g.: https://github.com/jenghis/nshift, https://github.com/smudge/nightlight, https://github.com/joshjon/nocturnal
else
    echo "$(RED 'Night Shift is disabled'); manually add scheduling under $(BLUE 'System Preferences > Displays > Night Shift options!')"
fi

# Turn off startup chime
sudo nvram StartupMute=%01

# Disable autocaps, autodash, period after sentences, smart quotes
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable macOS quarantine
defaults write com.apple.LaunchServices LSQuarantine -bool false


# Major TODOs:

# Enable dark mode 
# Enable permanent night shift (i.e. set max night shift from 6:00 AM → 5:59 AM
# Download the apps I want (Spotify, ...)
# Install npm, python3
# Extract subl bin
# Launchd / daemon setup stuff
