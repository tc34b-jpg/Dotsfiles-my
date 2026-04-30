#!/bin/bash
# Lista apenas o nome amigável e o ID das apps Flatpak
selected=$(flatpak list --app --columns=name,application | rofi -dmenu -p "Flatpaks" -i)

# Se o usuário selecionou algo, extrai o ID (segunda coluna) e executa
if [ ! -z "$selected" ]; then
    appid=$(echo "$selected" | awk '{print $NF}')
    flatpak run "$appid"
fi
