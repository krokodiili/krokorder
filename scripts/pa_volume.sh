#!/bin/bash

sink_index=$(pactl list sinks short | grep RUNNING | grep Focusrite | cut -f1)
sink_name=$(pactl list sinks short | grep RUNNING | grep Focusrite | cut -f2)

if [ "$1" = "up" ]; then
    pactl set-sink-volume "$sink_name" +5%
elif [ "$1" = "down" ]; then
    pactl set-sink-volume "$sink_name" -5%
elif [ "$1" = "mute" ]; then
    pactl set-sink-mute "$sink_name" toggle
fi

vol=$(pactl list sinks | grep -A20 "Sink #$sink_index" | grep "Volume" | head -1 | grep '^[[:space:]]Volume:' | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')

mute=$(pactl list sinks | grep '^[[:space:]]Mute:' | \
    head -n $(( sink_index + 2 )) | tail -n 1 | awk '{print $2}')

if [ "$mute" = "yes" ]; then
    echo "  $vol%"
else
    echo "  $vol%"
fi

