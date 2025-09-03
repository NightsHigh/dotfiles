#!/bin/bash
# battery-warning.sh
# Sends a notification when battery is low

LOW_BATTERY=15  # percentage threshold

while true; do
    # Read current battery status and percentage
    BATTERY_PERCENT=$(cat /sys/class/power_supply/BAT1/capac>
    BATTERY_STATUS=$(cat /sys/class/power_supply/BAT1/status)

    # If discharging and below threshold, send notification
    if [ "$BATTERY_STATUS" = "Discharging" ] && [ "$BATTERY_>
        notify-send -u critical -t 60000 "⚡ Battery Low" "B>
    fi

    sleep 180
done
