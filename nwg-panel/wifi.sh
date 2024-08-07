#!/bin/bash
# Get the connection type of the active connection
wifi_activated=$(nmcli -f TYPE con show --active | grep -i wifi)

# Check if the connection type contains 'wifi'
if [[ -n "$wifi_activated" ]]; then
    connection_name=$(nmcli -t -f GENERAL.CONNECTION device show wlan0 | cut -d ':' -f 2)
    signal_strength=$(nmcli -f IN-USE,SIGNAL,SSID device wifi | awk '/^\*/{if (NR!=1) {print $2}}')
    if [[ "$signal_strength" -gt 80 ]]; then
        echo "/usr/share/icons/Papirus-Dark/symbolic/status/network-wireless-signal-excellent-symbolic.svg"
    elif [[ "$signal_strength" -gt 50 ]]; then
        echo "/usr/share/icons/Papirus-Dark/symbolic/status/network-wireless-signal-good-symbolic.svg"
    elif [[ "$signal_strength" -gt 0 ]]; then
        echo "/usr/share/icons/Papirus-Dark/symbolic/status/network-wireless-signal-weak-symbolic.svg"
    else
        echo "/usr/share/icons/Papirus-Dark/symbolic/status/network-wireless-acquiring-symbolic.svg"
    fi
    echo $connection_name
else
    echo "/usr/share/icons/Papirus-Dark/symbolic/status/network-wireless-disabled-symbolic.svg"
    echo "disconnected"
fi
