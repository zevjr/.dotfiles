#!/bin/sh

getName() {
    name=$(pactl get-default-source);

    if [[ "$name" == *"G635"* ]]; then
        echo "Headphone"
    elif [[ "$name" == *"Webcam"* ]]; then
        echo "Webcam"
    else
        echo "Notebook"
    fi
}

case "$1" in
--popup)
    value=$(yad --list --splash --title "Opção de Audio" --column "Opção" --column "Entrada" --width="630" --height="215" $(pactl list short sources | grep -P 'input'| awk '{print $1,$2}'));

    opcao=$(echo $value | egrep -o '^[0-9]');

    eval "$(pacmd set-default-source $opcao)"
    ;;
--notify)
    name=$(getName)
    notify-send "$name" --icon=dialog-information
    ;;
*)
    name=$(getName)
    echo $name
    ;;
esac
