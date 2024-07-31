#!/bin/bash
if [ -z $(pidof waybar) ]; then
	waybar -c ~/Dotfiles/waybar/config -s ~/Dotfiles/waybar/style.css &
else
	killall waybar
	pkill waybar
fi
