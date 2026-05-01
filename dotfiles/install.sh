#!/bin/bash

echo "🚀 Iniciando a instalação do setup do Tc34b..."

# Instalando o essencial no Arch-basead
sudo pacman -Syu --noconfirm hyprland waybar rofi fish starship ttf-jetbrains-mono-nerd
yay -S wlogout --noconfirm

# Criando as pastas na .config
mkdir -p ~/.config

# Copiando as configurações
echo "📂 Copiando arquivos para ~/.config/..."
cp -r fish/* hypr/* rofi/* waybar/* wlogout/* ~/.config/
cp starship.toml ~/.config/
cp atualiza-setup.sh ~/
cp check-update.sh ~/

# Permissão para .sh
chmod +x *.sh

echo "✅ Pronto! Agora é só deslogar e entrar no Hyprland."
