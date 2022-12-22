
#!/bin/sh

BAR_HEIGHT=22  # polybar height
BORDER_SIZE=2  # border size from your wm settings
YAD_WIDTH=460  # 222 is minimum possible value
YAD_HEIGHT=400 # 193 is minimum possible value
DEFAULT_POS_X=1000
DEFAULT_POS_Y=00
DATE="$(TZ="America/Sao_Paulo" date +"%a, %d %B %H:%M")"

case "$1" in
--popup)
    if [ "$(xdotool getwindowfocus getwindowname)" = "yad-calendar" ]; then
        exit 0
    fi

    eval "$(xdotool getmouselocation --shell)"
    eval "$(xdotool getdisplaygeometry --shell)"

    # X
    # if [ "$((X + YAD_WIDTH / 2 + BORDER_SIZE))" -gt "$WIDTH" ]; then #Right side
    #     : $((pos_x = WIDTH - YAD_WIDTH - BORDER_SIZE))
    # elif [ "$((X - YAD_WIDTH / 2 - BORDER_SIZE))" -lt 0 ]; then #Left side
    #     : $((pos_x = BORDER_SIZE))
    # else #Center
    #     : $((pos_x = X - YAD_WIDTH / 2))
    # fi

    # # Y
    # if [ "$Y" -gt "$((HEIGHT / 2))" ]; then #Bottom
    #     : $((pos_y = HEIGHT - YAD_HEIGHT - BAR_HEIGHT - BORDER_SIZE))
    #     : $((pos_y = HEIGHT - YAD_HEIGHT - BAR_HEIGHT - BORDER_SIZE))
    # else #Top
    #     : $((pos_y = BAR_HEIGHT + BORDER_SIZE))
    # fi


    DATE_VALUE=$(yad --calendar \
        --width="$YAD_WIDTH" --height="$YAD_HEIGHT" \
        --title="yad-calendar" --borders=$BORDER_SIZE --date-format="%Y/%m/%d");

    [[ ! -z "$DATE_VALUE" ]] && firefox https://calendar.google.com/calendar/u/0/r/day/$DATE_VALUE?tab=mc
    ;;
*)
    echo "$DATE"
    ;;
esac
