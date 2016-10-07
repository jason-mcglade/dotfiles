#!/bin/bash

git submodule init
git submodule update

ln -sf $PWD/.config ~/.config
