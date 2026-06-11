#!/bin/bash

# ─────────────────────────────────────────
#   THEME SWITCHER
#   Temas: gray minim. | prototype
# ─────────────────────────────────────────

THEMES_DIR="$HOME/.config/themes"
CURRENT_FILE="$THEMES_DIR/current"

# ── Escolhe o tema via rofi ──
THEME=$(ls "$THEMES_DIR" | grep -v current | grep -v switch | rofi -dmenu -p "  Escolha o tema:")

[ -z "$THEME" ] && exit 0

THEME_DIR="$THEMES_DIR/$THEME"

# ── Copia os configs ──
cp "$THEME_DIR/waybar/style.css"        "$HOME/.config/waybar/style.css"
cp "$THEME_DIR/rofi/config.rasi"        "$HOME/.config/rofi/config.rasi"
cp "$THEME_DIR/fastfetch/config.jsonc"  "$HOME/.config/fastfetch/config.jsonc"
cp "$THEME_DIR/starship.toml"           "$HOME/.config/starship.toml"
cp "$THEME_DIR/kitty/kitty.conf"        "$HOME/.config/kitty/kitty.conf"
cp "$THEME_DIR/wlogout/style.css"       "$HOME/.config/wlogout/style.css"
cp "$THEME_DIR/fish/config.fish"        "$HOME/.config/fish/config.fish"
cp "$THEME_DIR/hypr/hyprpaper.conf"     "$HOME/.config/hypr/hyprpaper.conf"

# ── Recarrega kitty ──
kill -SIGUSR1 $(pgrep kitty)

# ── Reinicia o hyprpaper ──
killall hyprpaper
sleep 0.5
hyprpaper &disown

# ── Recarrega waybar ──
killall waybar && waybar &disown

# ── Recarrega hyprland ──
hyprctl reload

# ── Salva tema atual ──
echo "$THEME" > "$CURRENT_FILE"

# ── Notificação ──
notify-send "🎨 Tema alterado" "$THEME ativado!" --urgency=low
