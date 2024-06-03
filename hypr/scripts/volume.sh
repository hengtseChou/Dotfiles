#!/bin/bash

# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

_get_volume() {
    amixer get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

_is_mute() {
    amixer get Master | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
}

_send_notification()  {
    volume=$(_get_volume)
    # Send the notification
    dunstify -i audio-volume-high -t 1000 -a "changevolume" -u low -h string:x-dunst-stack-tag:volume -h int:value:$volume "  Volume $volume%"
}

case $1 in
    up)
	# Set the volume on (if it was muted)
	amixer -D pulse set Master on > /dev/null
	# Up the volume (+ 5%)
	amixer -D pulse sset Master 5%+ > /dev/null
	_send_notification
	;;
    down)
	amixer -D pulse set Master on > /dev/null
	amixer -D pulse sset Master 5%- > /dev/null
	_send_notification
	;;
    mute)
    	# Toggle mute
	amixer -D pulse set Master 1+ toggle > /dev/null
	if _is_mute ; then
	    dunstify -i audio-volume-muted -t 1000 -a "changevolume" -u low -h string:x-dunst-stack-tag:volume "  Mute"
	else
	    _send_notification
	fi
	;;
esac
