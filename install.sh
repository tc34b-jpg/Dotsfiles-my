#!/bin/bash

# ─────────────────────────────────────────
#   INSTALLER — tc34b's Dotsfiles
# ─────────────────────────────────────────

USER_HOME="/home/$USER"
CONFIG_DIR="$USER_HOME/.config"
THEMES_DIR="$CONFIG_DIR/themes"

# ── Colors ──
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
RESET='\033[0m'

echo -e "${RED}"
echo "  ██████╗  ██████╗ ████████╗███████╗"
echo "  ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝"
echo "  ██║  ██║██║   ██║   ██║   ███████╗"
echo "  ██║  ██║██║   ██║   ██║   ╚════██║"
echo "  ██████╔╝╚██████╔╝   ██║   ███████║"
echo "  ╚═════╝  ╚═════╝    ╚═╝   ╚══════╝"
echo -e "${RESET}"
echo -e "${WHITE}  tc34b's Dotsfiles Installer${RESET}"
echo -e "${CYAN}  user: $USER${RESET}"
echo ""

# ── Confirm ──
read -p "  Proceed with installation? [y/N] " confirm
[[ "$confirm" != "y" && "$confirm" != "Y" ]] && echo -e "${RED}  Aborted.${RESET}" && exit 0

echo ""

# ── Install dependencies ──
echo -e "${CYAN}[1/3] Installing dependencies...${RESET}"
sudo pacman -S --needed --noconfirm \
    hyprland \
    waybar \
    rofi-wayland \
    kitty \
    fish \
    starship \
    fastfetch \
    hyprpaper \
    hyprlock \
    wlogout \
    mako \
    playerctl \
    ttf-jetbrains-mono-nerd \
    notify-send

if [ $? -eq 0 ]; then
    echo -e "${GREEN}  ✓ Dependencies installed${RESET}"
else
    echo -e "${RED}  ✗ Error installing dependencies${RESET}"
    exit 1
fi

echo ""

# ── Copy themes ──
echo -e "${CYAN}[2/3] Copying themes...${RESET}"

mkdir -p "$THEMES_DIR"
cp -r themes/* "$THEMES_DIR/"

if [ $? -eq 0 ]; then
    echo -e "${GREEN}  ✓ Themes copied to $THEMES_DIR${RESET}"
else
    echo -e "${RED}  ✗ Error copying themes${RESET}"
    exit 1
fi

# ── Fix paths in hyprpaper.conf ──
echo -e "${CYAN}  Fixing paths for user: $USER...${RESET}"
find "$THEMES_DIR" -name "hyprpaper.conf" | while read file; do
    sed -i "s|/home/tc34b/|/home/$USER/|g" "$file"
done
echo -e "${GREEN}  ✓ Paths updated${RESET}"

echo ""

# ── Make switcher executable ──
echo -e "${CYAN}[3/3] Setting up switcher...${RESET}"
chmod +x "$THEMES_DIR/switch-theme.sh"
echo -e "${GREEN}  ✓ switch-theme.sh is now executable${RESET}"

echo ""
echo -e "${GREEN}  ✓ Installation complete!${RESET}"
echo ""
echo -e "${WHITE}  Next steps:${RESET}"
echo -e "${CYAN}  1. Add to hyprland.conf:${RESET}"
echo -e "     bind = \$mainMod, T, exec, ~/.config/themes/switch-theme.sh"
echo -e "${CYAN}  2. Add to fish config:${RESET}"
echo -e "     starship init fish | source"
echo -e "${CYAN}  3. Run the switcher and pick a theme!${RESET}"
echo ""
