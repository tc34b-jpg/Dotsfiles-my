#!/bin/bash
sleep 10 # Espera o Wi-Fi conectar
cd ~/Dotsfiles-my/dotfiles
git fetch origin
STATUS=$(git status)

if [[ $STATUS == *"Your branch is behind"* ]]; then
    notify-send "🚨 Nova Atualização do Tc!" "Abra o menu de desligar e clique em 'Atualizar Setup'."
fi
