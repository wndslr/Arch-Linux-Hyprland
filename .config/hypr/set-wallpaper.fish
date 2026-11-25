#!/usr/bin/env fish

set wallpaper_dir $HOME/wallpapers

# File list
set wallpapers (find $wallpaper_dir -type f \( -iname "*.jpg" -o -iname "*.png" \) | sort)

# Emptyness check
if test (count $wallpapers) -eq 0
    echo "Нет обоев в папке $wallpaper_dir"
    exit 1
end

# Random paper
set random_wallpaper (printf '%s\n' $wallpapers | shuf -n1)

# Set paper
awww img $random_wallpaper \
    --transition-type any \
    --transition-pos 0.5,0.5 \
    --transition-fps 60 \
    --transition-duration 1
