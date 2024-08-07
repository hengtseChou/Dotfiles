#!/bin/bash
hypridle=$(pgrep -x hypridle)
if [ -z $hypridle ]; then
    echo "/usr/share/icons/Papirus-Dark/16x16/actions/unlock.svg"
else
    echo "/usr/share/icons/Papirus-Dark/16x16/actions/lock.svg"
fi