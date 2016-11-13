#!/bin/bash

git submodule init
git submodule update

ln -sfh $PWD/.config ~/.config
ln -sfh $PWD/.spacemacs ~/.spacemacs

curl -fLo ~/Library/Fonts/Sauce\ Code\ Pro\ Nerd\ Font\ Complete.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SourceCodePro/Semibold/complete/Sauce%20Code%20Pro%20Semibold%20Nerd%20Font%20Complete.ttf
