#!/bin/bash

echo "🚀 Iniciando a instalação do setup do Tc34b..."

# Instalando o essencial no Arch-basead
sudo pacman -S --noconfirm hyprland waybar rofi wlogout fish starship ttf-jetbrains-mono-nerd

# Criando as pastas na .config do seu pai
mkdir -p ~/.config

# Copiando as configurações
echo "📂 Copiando arquivos para ~/.config/..."
cp -r fish/* hypr/* rofi/* waybar/* wlogout/* ~/.config/
cp starship.toml ~/.config/

echo "✅ Pronto! Agora é só deslogar e entrar no Hyprland."
