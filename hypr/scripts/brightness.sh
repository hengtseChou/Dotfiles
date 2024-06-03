#!/bin/bash
_send_notification() {
	g=$(brightnessctl g)
	m=$(brightnessctl m)
	p=$(echo "100 * $g / $m" | bc)
	dunstify -t 1000 -i display-brightness -a "changebrightness" -u low -h string:x-dunst-stack-tag:brightness -h int:value:$p "  Brightness $p%"
}

if [ "$1" == "+" ]; then
	brightnessctl -q s +5%
	_send_notification
elif [ "$1" == "-" ]; then
	brightnessctl -q s 5%-
	_send_notification
fi
