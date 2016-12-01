#!/bin/bash

echo "**** Downloading Custom Fonts ****"
curl -s -fLo ~/Library/Fonts/Sauce\ Code\ Pro\ Nerd\ Font\ Complete.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SourceCodePro/Semibold/complete/Sauce%20Code%20Pro%20Semibold%20Nerd%20Font%20Complete.ttf

echo "**** Installing oh-my-zsh ****"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "**** Install Docker Compose ****"
# Pre-req: Install docker for mac - https://docs.docker.com/docker-for-mac/
curl -s -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

echo "**** Install Docker Compose Zsh Completion ****"
mkdir -p ~/.zsh/completion
curl -s -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/zsh/_docker-compose > ~/.zsh/completion/_docker-compose

echo "**** Linking DotFiles ****"
git submodule init
git submodule update

ln -sfh $PWD/.config ~/.config
ln -sfh $PWD/.spacemacs ~/.spacemacs
ln -sfh $PWD/.zshrc ~/.zshrc
