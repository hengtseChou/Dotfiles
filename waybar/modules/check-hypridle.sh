#!/bin/bash
hypridle=$(pgrep -x hypridle)
if [ -z $hypridle ]; then
    printf '{"text": "", "alt": "deactivated", "tooltip": "deactivated"}'
else
    printf '{"text": "", "alt": "activated", "tooltip": "activated"}'
fi