## Components

| Role | Program |
|------|---------|
| Window Manager | [Hyprland](https://hyprland.org/) |
| Status Bar | [Waybar](https://github.com/Alexays/Waybar) |
| Terminal | [Kitty](https://sw.kovidgoyal.net/kitty/) |
| Editor | [Neovim](https://neovim.io/) |
| Launcher | [Wofi](https://hg.sr.ht/~scoopta/wofi) |
| Lock Screen | [Hyprlock](https://github.com/hyprwm/hyprlock) |
| Wallpaper | [awww](https://codeberg.org/LGFae/awww) |
| Shell | [Fish](https://fishshell.com/) |
| Notifications | [swaync](https://github.com/ErikReider/SwayNotificationCenter) |
| File Manager | [Thunar](https://docs.xfce.org/xfce/thunar/start) |
| Display Manager | [SDDM](https://github.com/sddm/sddm) + [where-is-my-sddm-theme](https://github.com/stepanzubkov/where-is-my-sddm-theme) |

---
## Installing packages
### Install yay
```bash
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -Si
```
### Programs
```bash
yay -S zen-browser-bin hyprshot clipse brightnessctl cpupower timeshift telegram-desktop thunar udiskie swaync playerctl
```
```bash
yay -S hyprland waybar kitty neovim wofi hyprlock hyprpaper awww fish
```
If you're on ASUS
```bash
yay -S asusctl
```
---

## Installing configs

```bash
git clone https://github.com/wndslr/Arch-Linux-Hyprland.git ~/Arch-Linux-Hyprland
cd ~/Arch-Linux-Hyprland/
# I recommend reviewing the script before running it it's a good practice
chmod +x install.sh
./install.sh
```
## SDDM theme

Install the theme:
```bash
git clone https://github.com/stepanzubkov/where-is-my-sddm-theme.git
cd where-is-my-sddm-theme
chmod +x install.sh
sudo ./install.sh
```
Apply my config:
```bash
cd ~/Arch-Linux-Hyprland/.sddm
cp theme.conf /usr/share/sddm/themes/where_is_my_sddm_theme_qt5/theme.conf
```

---

## Wallpaper

The `set-wallpaper.fish` script picks a random wallpaper from the `~/wallpapers/` directory.
Triggered with `Super + A`.

---

## Keybinds

> `$mainMod` = **Super (Win)**

### Apps

| Keybind | Action |
|---------|--------|
| `Super + Q` | Open terminal |
| `Super + E` | File manager |
| `Super + R` | Launcher (wofi) |
| `Super + B` | Browser (zen-browser) |
| `Super + T` | Telegram |
| `Super + V` | Clipboard (clipse) |
| `Super + A` | Random wallpaper |

### System

| Keybind | Action |
|---------|--------|
| `Super + W` | Close window |
| `Super + L` | Lock screen |
| `Super + D` | Toggle Waybar |
| `Super + M` | Exit Hyprland |

### Screenshots (hyprshot)

| Keybind | Action |
|---------|--------|
| `Print` | Screenshot selected area |
| `Super + F12` | Screenshot full screen |

### Audio

| Keybind | Action |
|---------|--------|
| `Super + F1` | Mute |
| `Super + F2` | Volume −10% |
| `Super + F3` | Volume +10% |

### Screen brightness

| Keybind | Action |
|---------|--------|
| `Super + F4` | Brightness low |
| `Super + F5` | Brightness high |

### Navigation

| Keybind | Action |
|---------|--------|
| `Super + ←↑↓→` | Focus window |
| `Super + 1–0` | Switch workspace |
| `Super + Shift + 1–0` | Move window to workspace |
| `Super + S` | Special workspace |
| `Super + Shift + S` | Move to special workspace |
| `Super + LMB` | Drag window |
| `Super + RMB` | Resize window |

---

## ASUS-specific, tested on a Vivobook Pro 15 with AMD Ryzen 7 5800H

The following keybinds and functions only work on ASUS laptops
and require `asusctl` + `brightnessctl`:

- `Super + F6/F7` — keyboard backlight
- `Super + F8/F9` — disable/enable touchpad (F9 sets sensitivity to 0, F8 to -0.8)
- Fish functions `bat60` / `bat100` battery charge limit
- Fish functions `offtouch` / `ontouch` touchpad (you'll need to swap in your own device id)

Find your touchpad device id:
```bash
hyprctl devices | grep -i touchpad
```

---

## Fish functions

| Function | Action |
|----------|--------|
| `update` | `yay -Syu` |
| `performance` | CPU performance mode |
| `powersave` | CPU power-saving mode |
| `archScreen` | Create a Timeshift snapshot |
| `mousemode` | Mouse sensitivity −0.8 |
| `touchpadmode` | Touchpad sensitivity 0 |

You'll want to tune the sensitivity for yourself (it ranges from -1 to 1).

The scripts live in the fish config.
```bash
~/.config/fish/config.fish
```

If you want, you can add fastfetch output to your terminal on startup, but personally I think it just eats up useful space, especially on a small laptop screen.
```bash
sudo pacman -S fastfetch
