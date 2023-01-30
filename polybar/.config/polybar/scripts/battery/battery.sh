#!/usr/bin/bash

# Prashant Shrestha
# 2020-06-23

# Getting the data and initializing an array.
# BATTERY_INFO=$( acpitool | head -n1 | awk -F' ' '{print $4}' | tr -d ',' )
# CHARGE=$(($( acpitool | head -n1 | awk -F',' '{print $2}' | tr -d '.%' ) / 10))

# # Formatting helpers
# ICON=""
# FORMAT=""

# # Format battery icon, depending on the status.
# if [[ "${BATTERY_INFO}" == *"Charging"* ]]; then
#     ICON="  " # Plug icon, font awesome.
# else
#     ICON="🔋 " # Car Battery icon, font awesome
# fi

# if [[ $CHARGE -lt 10 ]]; then
#     # Red-ish
#     FORMAT="%{B#B33D43}%{F#fff}  "
# elif [[ $CHARGE -lt 30 ]]; then
#     # Orange-ish
#     FORMAT="%{B#F27F24}%{F#000}  "
# elif [[ $CHARGE -lt 60 ]]; then
#     # Yellow-ish
#     FORMAT="%{B#E5C167}%{F#000}  "
# else
#     # Green-ish
#     FORMAT="%{B#6FB379}%{F#000}  "
# fi

# # Format charge & color depending on the status.
# if [[ $CHARGE -eq 100 ]]; then
#     FORMAT="$FORMAT$ICON $CHARGE% %{B- F-}"
# else
#     FORMAT="$FORMAT$ICON ${CHARGE:0:2}% %{B- F-}"
# fi

FORMAT=$(upower -i $(upower -e | grep BAT) | grep --color=never -E 'percentage' | awk '{print $2}')
CHARGE=$(upower -i $(upower -e | grep BAT) | grep --color=never -E 'state' | awk '{print $2}')
# Final formatted output.

echo $FORMAT
