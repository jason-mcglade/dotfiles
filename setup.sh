#!/bin/bash

git submodule init
git submodule update

ln -sf $PWD/.config ~/.config

curl -fLo ~/Library/Fonts/Sauce\ Code\ Pro\ Nerd\ Font\ Complete.ttf https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete.ttf
