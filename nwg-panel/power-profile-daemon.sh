#!/bin/bash
current=$(powerprofilesctl get)
if [[ $current == "performance" ]]; then
    echo "/usr/share/icons/Papirus-Dark/symbolic/status/power-profile-performance-symbolic.svg"
elif [[ $current == "balanced" ]]; then 
    echo "/usr/share/icons/Papirus-Dark/symbolic/status/power-profile-balanced-symbolic.svg"
elif [[ $current == "power-saver" ]]; then
    echo "/usr/share/icons/Papirus-Dark/symbolic/status/power-profile-power-saver-symbolic.svg"
fi
