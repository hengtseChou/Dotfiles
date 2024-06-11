#!/bin/bash
if [ -z $(pidof waybar) ]; then
	waybar -c ~/my-hypr/waybar/config -s ~/my-hypr/waybar/style.css &
else
	killall waybar
	pkill waybar
fi


