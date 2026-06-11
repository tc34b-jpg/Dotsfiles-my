#!/bin/bash

# Lista apenas os Flatpaks
lista=$(flatpak list --app --columns=name,application)

# Abre o Rofi
escolha=$(echo "$lista" | rofi -dmenu -i -p "󰏖 Flatpaks" -theme-str 'window {width: 30%;}')

# Se algo foi escolhido, executa
if [ -n "$escolha" ]; then
    id=$(echo "$escolha" | awk '{print $NF}')
    flatpak run "$id"
fi
