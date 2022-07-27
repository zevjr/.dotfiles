#!/bin/sh
case "$1" in
--popup)
    value=$(yad --list --splash --title "Opção de Audio" --column "Opção" --column "Saida" --width="630" --height="215" $( pactl list short sinks | awk '{print $1,$2}'));

    opcao=$(echo $value | egrep -o '^[0-9]');

    eval "$(pacmd set-default-sink $opcao)"
    ;;
*)
    name=$(pactl info | grep -i "destino padrão" | awk '{print $3}');

    if [[ "$name" == *"G635"* ]]; then
        echo "Headphone"
    else
        echo "Subwoofer"
    fi
    ;;
esac

