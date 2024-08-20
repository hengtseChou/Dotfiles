#!/bin/bash
hypridle=$(pgrep -x hypridle)
if [ -z $hypridle ]; then
    printf '{"text": "", "alt": "0", "tooltip": "activated", "class": ""}'
else
    printf '{"text": "", "alt": "0", "tooltip": "deactivated", "class": ""}'
fi