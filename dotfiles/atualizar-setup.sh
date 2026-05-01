#!/bin/bash

# 1. Avisa que começou
notify-send "⏳ Atualizando o Setup..." "Buscando novidades do GitHub do Tc..."

# 2. Entra na pasta onde ele baixou o seu repositório
cd ~/Dotsfiles-my/dotfiles

# 3. Puxa as atualizações mais recentes da branch main
git pull origin main

# 4. Copia os arquivos novos para a .config dele
cp -r fish/ hypr/ rofi/ waybar/ wlogout/ ~/.config/
cp starship.toml ~/.config/

# 5. Avisa que deu tudo certo e recarrega o Hyprland e o Waybar
notify-send "✅ Setup Atualizado!" "Tudo no esquema. Recarregando a interface..."
hyprctl reload
killall waybar && waybar &
sudo pacman -Sc
