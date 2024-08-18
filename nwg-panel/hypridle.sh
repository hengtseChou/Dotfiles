#!/bin/bash
hypridle=$(pgrep -x hypridle)
if [ -z $hypridle ]; then
    echo "$HOME/Dotfiles/nwg-panel/icons/unlock.svg"
else
    echo "$HOME/Dotfiles/nwg-panel/icons/lock.svg"
fi
