#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_DIR="$HOME/.config"

configs=(
  "hypr"
  "waybar"
  "kitty"
  "nvim"
  "wofi"
  "fish"
)

for cfg in "${configs[@]}"; do
  src="$DOTFILES_DIR/.config/$cfg"
  dst="$CONFIG_DIR/$cfg"
  if [ -d "$src" ]; then
    if [ -d "$dst" ]; then
      backup="${dst}.bak.$(date +%Y%m%d%H%M%S)"
      echo -e "Existing ~/.config/$cfg found, backing up to $backup"
      mv "$dst" "$backup"
    fi
    echo -e "Copying $cfg..."
    cp -r "$src" "$CONFIG_DIR/"
  else
    echo -e "Skipping $cfg (not found in dotfiles)"
  fi
done

echo ""

WALLPAPER_DIR="$HOME/wallpapers"
if [ ! -d "$WALLPAPER_DIR" ]; then
  echo -e "Creating ~/wallpapers/..."
  mkdir -p "$WALLPAPER_DIR"
fi

echo ""
echo "Done!"
echo "Note: the SDDM theme (.sddm/theme.conf) is NOT installed by this script."
echo "See README.md for the manual SDDM setup steps."
echo ""
