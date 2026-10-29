## Компоненты

| Роль | Программа |
|------|-----------|
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
| Display Manager | [SDDM](https://github.com/sddm/sddm) + [sddm-astronaut-theme](https://github.com/keyitdev/sddm-astronaut-theme) |

---
## Установка программ
### Установка yay
```bash
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -Si
```
### Программы
```bash
yay -S zen-browser-bin hyprshot clipse brightnessctl cpupower timeshift telegram-desktop thunar udiskie swaync playerctl
```
```bash
yay -S hyprland waybar kitty neovim wofi hyprlock hyprpaper awww fish
```
Если ASUS
```bash
yay -S asusctl
```
---

## Установка конфигов

```bash
git clone https://github.com/wndslr/Arch-Linux-Hyprland.git ~/Arch-Linux-Hyprland
cd ~/Arch-Linux-Hyprland/
# Рекомендую проверить скрипт перед запуском, хорошая практика
chmod +x install.sh
./install.sh
```

---

## Обои

Скрипт `set-wallpaper.fish` ставит случайные обои из директории `~/wallpapers/`.
Запускается через `Super + A`.

---

## Хоткеи

> `$mainMod` = **Super (Win)**

### Приложения

| Хоткей | Действие |
|--------|----------|
| `Super + Q` | Открыть терминал |
| `Super + E` | Файловый менеджер |
| `Super + R` | Launcher (wofi) |
| `Super + B` | Браузер (zen-browser) |
| `Super + T` | Telegram |
| `Super + V` | Буфер обмена (clipse) |
| `Super + A` | Случайные обои |

### Система

| Хоткей | Действие |
|--------|----------|
| `Super + W` | Закрыть окно |
| `Super + L` | Заблокировать экран |
| `Super + D` | Показать/скрыть Waybar |
| `Super + M` | Выйти из Hyprland |

### Скриншоты (hyprshot)

| Хоткей | Действие |
|--------|----------|
| `Print` | Скриншот выделенной области |
| `Super + F12` | Скриншот всего экрана |

### Звук

| Хоткей | Действие |
|--------|----------|
| `Super + F1` | Mute |
| `Super + F2` | Громкость −10% |
| `Super + F3` | Громкость +10% |

### Яркость экрана

| Хоткей | Действие |
|--------|----------|
| `Super + F4` | Яркость мин. |
| `Super + F5` | Яркость макс. |

### Навигация

| Хоткей | Действие |
|--------|----------|
| `Super + ←↑↓→` | Фокус на окно |
| `Super + 1–0` | Переключить workspace |
| `Super + Shift + 1–0` | Переместить окно в workspace |
| `Super + S` | Special workspace |
| `Super + Shift + S` | Переместить в special workspace |
| `Super + ЛКМ` | Перетащить окно |
| `Super + ПКМ` | Изменить размер окна |

---

## Специфично для ASUS, тестил на vivobook pro 15 с AMD Ryzen 7 5800H

Хоткеи и функции работают только на ноутбуках ASUS,
и требуют `asusctl` + `brightnessctl`:

- `Super + F6/F7` — подсветка клавиатуры
- `Super + F8/F9` — включить/выключить тачпад (F9 ставит чувствительность 0, F8 -0.8)
- Fish функции `bat60` / `bat100` — лимит заряда батареи
- Fish функции `offtouch` / `ontouch` — тачпад (device id надо поменять на свой)

Посмотреть свой device id тачпада:
```bash
hyprctl devices | grep -i touchpad
```

---

## Fish команды

| Функция | Действие |
|---------|----------|
| `update` | `yay -Syu` |
| `performance` | Режим производительности CPU |
| `powersave` | Режим экономии CPU |
| `archScreen` | Создать снапшот Timeshift |
| `mousemode` | Чувствительность мыши −0.8 |
| `touchpadmode` | Чувствительность тачпада 0 |

Тут нужно подгнать чувствительность под себя диапазон от -1 до 1,

Скрипты находятся в конфиге fish.
```bash
~/.config/fish/config.fish
```

По желанию можно прописать в конфиг при запуске терминала вывод fastfetch со спеками системы, но как по мне это только занимает полезное пространство, особенно на небольшом экране ноутбука.
```bash
sudo pacman -S fastfetch
```
