
# install NVM (node version manager)
if [ ! command -v nvm ]; then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
fi

if [ ! -d ~/repos ]; then
  mkdir ~/repos
fi
