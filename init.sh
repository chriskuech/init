#!/bin/bash

# install NVM (node version manager)
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

# load NVM (required as of Jan 2019)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# create ~/repos
mkdir ~/repos

# install linuxbrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

# install git credential manager
brew install git-credential-manager
git-credential-manager install

# install f.lux (fails as of Dec 2018)
# sudo add-apt-repository ppa:nathan-renniewaldock/flux
# sudo apt-get update
# sudo apt-get install fluxgui

# (almost) fix trackpad driver on kubuntu
sudo apt install xserver-xorg-input-synaptics

# set default directory (macOS Terminal feature shim Jan 2018)
DEAFULTDIR="~/Projects"
if [ "$OLDPWD" ] && [ $PWD = $HOME ]; then
    cd $DEAFULTDIR
fi
