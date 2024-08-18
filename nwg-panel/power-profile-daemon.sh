#!/bin/bash
current=$(powerprofilesctl get)
if [[ $current == "performance" ]]; then
    echo "$HOME/Dotfiles/nwg-panel/icons/power-profile-performance-symbolic.svg"
elif [[ $current == "balanced" ]]; then 
    echo "$HOME/Dotfiles/nwg-panel/icons/power-profile-balanced-symbolic.svg"
elif [[ $current == "power-saver" ]]; then
    echo "$HOME/Dotfiles/nwg-panel/icons/power-profile-power-saver-symbolic.svg"
fi
