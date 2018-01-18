#!/bin/bash

echo "**** Linking DotFiles ****"
ln -sfh $PWD/.config ~/.config
ln -sfh $PWD/.zshrc ~/.zshrc
ln -sfh $PWD/.config/tmux ~/.tmux
ln -sfh $PWD/.tmux.conf ~/.tmux.conf

# echo "**** Installing neovim python support ****"
# pip3 install neovim
