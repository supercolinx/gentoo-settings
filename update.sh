#!/bin/sh
# @file		update.sh
# @author	Colin X
# @data		Sat Nov  8 16:25:39 2025
# @description:

# update i3wm config
if [ -f $HOME/.config/i3/config ]; then
	cp $HOME/.config/i3/config config/i3/config
fi

# update i3status config
if [ -f $HOME/.config/i3status/config ]; then
	cp $HOME/.config/i3status/config config/i3status/config
fi

# update kernel config
if [ -f /usr/src/linux/.config ]; then
	cp /usr/src/linux/.config kernel/config
fi

# update X resources
if [ -f $HOME/.Xresources ]; then
	cp $HOME/.Xresources X/Xresources
fi

# update vim config
if [ -f /etc/vim/vimrc.local ]; then
	cp /etc/vim/vimrc.local vim/vimrc.local
fi

# update neofetch config
if [ -f $HOME/.config/neofetch/config.conf ]; then
	cp $HOME/.config/neofetch/config.conf config/neofetch/config.conf
fi
