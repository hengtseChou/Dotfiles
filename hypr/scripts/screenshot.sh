#!/bin/bash
#  ____                               _           _
# / ___|  ___ _ __ ___  ___ _ __  ___| |__   ___ | |_
# \___ \ / __| '__/ _ \/ _ \ '_ \/ __| '_ \ / _ \| __|
#  ___) | (__| | |  __/  __/ | | \__ \ | | | (_) | |_
# |____/ \___|_|  \___|\___|_| |_|___/_| |_|\___/ \__|
#
#
# by Stephan Raabe (2023)
# -----------------------------------------------------

DIR="$HOME/Pictures/Screenshots/"
NAME="Screenshot from $(date "+%Y-%m-%d %H-%M-%S").png"

option1="Selected area"
option2="Fullscreen"
option3="Fullscreen (delay 3 sec)"

options="$option1\n$option2\n$option3"

choice=$(echo -e "$options" | rofi -dmenu -replace -config $HOME/my-hypr/rofi/config-screenshot.rasi -i -no-show-icons -l 3 -width 30 -p "Take Screenshot")

case $choice in
$option1)
    grim -g "$(slurp)" "$DIR$NAME"
    xclip -selection clipboard -t image/png -i "$DIR$NAME"
    notify-send "Screenshot created and copied to clipboard" "Mode: $option1"
    swappy -f "$DIR$NAME"
    ;;
$option2)
    sleep 0.5
    grim "$DIR$NAME"
    xclip -selection clipboard -t image/png -i "$DIR$NAME"
    notify-send "Screenshot created and copied to clipboard" "Mode: $option2"
    swappy -f "$DIR$NAME"
    ;;
$option3)
    sleep 3
    grim "$DIR$NAME"
    xclip -selection clipboard -t image/png -i "$DIR$NAME"
    notify-send "Screenshot created and copied to clipboard" "Mode: $option3"
    swappy -f "$DIR$NAME"
    ;;
esac
