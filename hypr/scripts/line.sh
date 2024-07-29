#!/bin/bash
chromium \
    --enable-features=UseOzonePlatform \
    --ozone-platform=wayland \
    --enable-wayland-ime \
    --app=chrome-extension://ophjlpahpchlmihnnnihgmmeilfjmjjc/index.html
