#!/usr/bin/env bash

UNSPLASH_DIR="$HOME/unsplash"

DATE=$(date +"%A, %B %-d")
# WEATHER=$(curl -s wttr.in?format="+%c+%t")

ringcolor=FFFFFFFF
insidecolor=00000000
linecolor=00000000
separatorcolor=00000000

ringvercolor=00000000
insidevercolor=00000000

ringwrongcolor=00000000
insidewrongcolor=00000000

keyhlcolor=AAAAAAFF
bshlcolor=AAAAAAFF

if [[ "$#" -eq 0 ]]; then
    SUSPEND=0
elif [[ "$#" -eq 1 && "$1" = '-s' ]]; then
    SUSPEND=1
else
    echo "Usage: $(basename $0) [-s]" >&2
    exit 1
fi

if [[ "$SUSPEND" -eq 0 ]]; then
    ARGS="-n"
else
    ARGS=""
fi

i3lock "$ARGS" -t -i "$UNSPLASH_DIR"/image.png \
    --clock --force-clock --time-str="%H:%M:%S" --time-size=96 --time-color=FFFFFFFF \
     --date-str="$DATE" --date-pos="tx:ty" --date-size=32 --date-color=FFFFFFFF \
    --ind-pos="w/2-r/2:h-r*2" --radius 20 \
    --ring-color=$ringcolor --inside-color=$insidecolor --line-color=$linecolor \
    # --separatorcolor=$separatorcolor --ringvercolor=$ringvercolor \
    # --insidevercolor=$insidevercolor --veriftext='' --ringwrongcolor=$ringwrongcolor \
    # --insidewrongcolor=$insidewrongcolor --wrongtext='' --keyhlcolor=$keyhlcolor \
    # --bshlcolor=$bshlcolor --noinputtext=''

if [[ "$SUSPEND" -eq 1 ]]; then
    if type nvidia-smi 2>/dev/null; then
        if [[ $(nvidia-smi --query-compute-apps=pid --format=csv,noheader | wc -l) -eq 0 ]]; then
            systemctl suspend
        fi
    else
        systemctl suspend
    fi
fi

feh --bg-scale $HOME/unsplash/image.png

if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
    unsplash.sh > $HOME/unsplash/log 2>&1 &
fi
