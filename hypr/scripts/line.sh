#!/bin/bash
chromium \
 --enable-features=UseOzonePlatform \
 --ozone-platform=wayland \
 --enable-wayland-ime \
 --app=chrome-extension://ophjlpahpchlmihnnnihgmmeilfjmjjc/index.html 
# --window-size=800,600 \
# --window-position=400,100
