#!/bin/bash
if [ -z $(pidof waybar) ]; then
	waybar -c ~/dotfiles/waybar/config -s ~/dotfiles/waybar/style.css &
else
	killall waybar
	pkill waybar
fi
