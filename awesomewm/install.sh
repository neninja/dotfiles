#!/usr/bin/env bash

mkdir -p $HOME/.config/awesome
ln -vsf $(pwd)/rc.lua $HOME/.config/awesome/rc.lua
ln -vsf $(pwd)/mytheme.lua $HOME/.config/awesome/mytheme.lua
cp -rf $(pwd)/wallpapers $HOME/.config/awesome/wallpapers

cd $HOME/.config/awesome
git clone https://github.com/deficient/battery-widget.git
