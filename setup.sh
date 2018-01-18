#!/bin/bash

echo "**** Linking DotFiles ****"
ln -sfh ~/.dotfiles/.config ~/.config
ln -sfh ~/.dotfiles/.zshrc ~/.zshrc
ln -sfh ~/.dotfiles/.config/tmux ~/.tmux
ln -sfh ~/.dotfiles/.tmux.conf ~/.tmux.conf

# echo "**** Installing neovim python support ****"
# pip3 install neovim
