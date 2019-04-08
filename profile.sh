
# enable piping strings to clipboard
alias clip='xclip -sel clip'

# load NVM (required as of Jan 2019)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# enable clis installed with pip (macOS)
export PATH="$HOME/Library/Python/2.7/bin:$PATH"

# set default directory (macOS Terminal feature shim Jan 2018)
DEFAULTDIR="$HOME/Projects"
if [ -z "$OLDPWD" ] && [ $PWD = $HOME ]; then
    cd $DEFAULTDIR
fi

# use firefox command (macOS)
alias firefox="/Applications/Firefox\ Developer\ Edition.app/Contents/MacOS/firefox"

# change bash prompt text
#  https://stackoverflow.com/questions/4842424/list-of-ansi-color-escape-sequences
export CLICOLOR=1
DEFAULTCOLOR="\\033[0m"
DARKGRAY="\\033[38;5;238m"
BOLDLIGHTCYAN="\\033[38;5;51;1m"
export PS1="\[$DARKGRAY\]\A\[$BOLDLIGHTCYAN\]\W\[$DARKGRAY\]▷ \[$DEFAULTCOLOR\]"
