xrandr --output "$SIDE_MONITOR" --auto --rotate right --output "$WORK_MONITOR" --auto --right-of "$SIDE_MONITOR"


nitrogen --restore &

i3-msg "workspace 1, move workspace to output $WORK_MONITOR"
i3-msg "workspace 2, move workspace to output $WORK_MONITOR"
i3-msg "workspace 3, move workspace to output $WORK_MONITOR"
i3-msg "workspace 4, move workspace to output $WORK_MONITOR"
i3-msg "workspace 5, move workspace to output $SIDE_MONITOR"
i3-msg "workspace 6, move workspace to output $SIDE_MONITOR"

