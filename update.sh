#!/bin/sh
# @file		update.sh
# @author	Colin X
# @data		Sat Nov  8 16:25:39 2025
# @description:

# update i3wm config
cp $HOME/.config/i3/config config/i3/config

# update kernel config
cp /usr/src/linux/.config kernel/config

# update X resources
cp $HOME/.Xresources X/Xresources
