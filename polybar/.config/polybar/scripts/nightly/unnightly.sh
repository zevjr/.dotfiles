#!/bin/sh

end_brightness=0.80
start_brightness=0.60

end_gamma=1:1:1
start_gamma=1.0:0.88:0.76

nightly(){
    for i in $(echo $3 | tr "," "\n"); do
        xrandr  --output $i --brightness $1 --gamma $2
        echo "Done $i!"
    done
}

monitors=$(xrandr --listactivemonitors | awk '{print $4}' | xargs | tr ' ' ',')

brightness=$(xrandr --verbose --current | grep ^"HDMI-1" -A5 | tail -n1 | awk '{print $2}')


if [[ "$brightness" == "$end_brightness" ]]; then
    nightly $start_brightness $start_gamma $monitors
else
    nightly $end_brightness $end_gamma $monitors
fi
# eval "$(xrandr --output DP-2 --brightness 0.55 --gamma 1.0:0.88:0.76)"
# eval "$(xrandr --output DP-2 --brightness 0.8 --gamma 1:1:1)"
