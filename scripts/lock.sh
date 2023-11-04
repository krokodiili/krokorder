
#!/usr/bin/env zsh

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

betterlockscreen --lock -u ~/wallpapers --display 2 --dim 20


