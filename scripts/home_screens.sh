xrandr --output HDMI-0 --auto --panning 0x0 --output DP-4 --auto --right-of HDMI-0

feh --bg-fill ~/Images/bg.jpg --bg-fill ~/Images/bg1.jpg

i3-msg "workspace 1, move workspace to output DP-4"
i3-msg "workspace 2, move workspace to output DP-4"
i3-msg "workspace 3, move workspace to output DP-4"
i3-msg "workspace 4, move workspace to output HDMI-0"
i3-msg "workspace 5, move workspace to output HDMI-0"
i3-msg "workspace 6, move workspace to output HDMI-0"
