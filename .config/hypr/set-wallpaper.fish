#!/usr/bin/env fish

set wallpaper_dir /home/wnd/blackwallpaper/

# Получаем список файлов в переменную
set wallpapers (find $wallpaper_dir -type f \( -iname "*.jpg" -o -iname "*.png" \) | sort)

# Проверка на пустоту
if test (count $wallpapers) -eq 0
    echo "Нет обоев в папке $wallpaper_dir"
    exit 1
end

# Выбираем случайную обойку
set random_wallpaper (printf '%s\n' $wallpapers | shuf -n1)

# Применяем обои
awww img $random_wallpaper \
    --transition-type any \
    --transition-pos 0.5,0.5 \
    --transition-fps 60 \
    --transition-duration 1
