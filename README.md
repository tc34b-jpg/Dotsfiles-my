# 🎨 Dotsfiles-my — tc34b

> My personal Hyprland rice with multiple themes

---

## 📸 Themes

| Theme | Colors | Inspiration |
|-------|--------|-------------|
| `gray_minim` | Cyan + Dark Blue | Minimalist |
| `prototype` | Blood Red + Black | Prototype (game) |
| `UltraRice` | Neon Red + Pure Black | ULTRAKILL (game) |

---

## 📦 Dependencies

```bash
sudo pacman -S hyprland waybar rofi-wayland kitty fish starship \
               fastfetch hyprpaper hyprlock wlogout mako playerctl \
               ttf-jetbrains-mono-nerd libnotify
```

---

## 📁 Structure

```
~/.config/themes/
├── install.sh
├── switch-theme.sh
├── current
├── gray_minim/
│   ├── waybar/style.css
│   ├── rofi/config.rasi
│   ├── fastfetch/config.jsonc
│   ├── kitty/kitty.conf
│   ├── wlogout/style.css
│   ├── fish/config.fish
│   ├── starship.toml
│   └── hypr/
│       ├── hyprpaper.conf
│       ├── hyprlock.conf
│       ├── wallpaper-hdmi.png
│       └── wallpaper-edp.png
├── prototype/
│   └── ... (same structure)
└── UltraRice/
    └── ... (same structure)
```

---

## 🚀 Installation

```bash
git clone https://github.com/tc34b-jpg/Dotsfiles-my.git
cd Dotsfiles-my
./install.sh
```

The script will:
- Install all dependencies via pacman
- Copy themes to `~/.config/themes/`
- Fix all paths automatically for your user
- Make the switcher executable

---

## ⚙️ After installation

1. Add to your `hyprland.conf`:
```ini
bind = $mainMod, T, exec, ~/.config/themes/switch-theme.sh
```

2. Or add to your Waybar config:
```json
"custom/theme": {
    "format": "󰏘",
    "on-click": "~/.config/themes/switch-theme.sh",
    "tooltip-format": "Switch theme"
}
```

3. Add to your `~/.config/fish/config.fish`:
```fish
starship init fish | source
```

---

## ⚙️ What the switcher does

When you select a theme, the script automatically:
- Copies all config files to their correct destinations
- Reloads Waybar
- Reloads Kitty (via SIGUSR1)
- Restarts Hyprpaper
- Reloads Hyprland
- Sends a notification confirming the change

---

## 📝 Notes

- **Monitors:** configs assume `HDMI-A-1` as external monitor and `eDP-1` as laptop screen. Adjust in `hyprpaper.conf` if needed.
- **Font:** JetBrainsMono Nerd Font is required for icons to display correctly.
- **AUR:** `wlogout` may require an AUR helper like `yay` or `paru`.

---

## 🖥️ Setup

- **OS:** Arch Linux
- **WM:** Hyprland
- **Bar:** Waybar
- **Terminal:** Kitty
- **Shell:** Fish + Starship
- **Launcher:** Rofi
- **Fetch:** Fastfetch
- **Wallpaper:** Hyprpaper
- **Lockscreen:** Hyprlock
- **Logout:** Wlogout
- **Notifications:** Mako

---

<p align="center">made with 🩸 by tc34b</p>
