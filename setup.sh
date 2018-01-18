#!/bin/bash

echo "**** Linking DotFiles ****"
ln -sfh ~/.config ~/.config
ln -sfh ~/.zshrc ~/.zshrc
ln -sfh ~/.config/tmux ~/.tmux
ln -sfh ~/.tmux.conf ~/.tmux.conf

# echo "**** Installing neovim python support ****"
# pip3 install neovim
