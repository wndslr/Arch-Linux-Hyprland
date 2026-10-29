set -g fish_greeting ""
set -g fish_color_user white
set -g fish_color_host white

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function performance
    sudo cpupower frequency-set -g performance
end

function powersave
    sudo cpupower frequency-set -g powersave
end

function mousemode
    hyprctl eval 'hl.config({ input = { sensitivity = -0.8 } })'
end

function touchpadmode
    hyprctl eval 'hl.config({ input = { sensitivity = 0 } })'
end

function offtouch
    hyprctl eval 'hl.device({ name="asue120b:00-04f3:31c0-touchpad", enabled=false })'
end

function ontouch
    hyprctl eval 'hl.device({ name="asue120b:00-04f3:31c0-touchpad", enabled=true })'
end

function bat60
    asusctl battery limit 60
    echo OK
end

function bat100
    asusctl battery limit 100
    echo OK
end

function archScreen
    echo "Удаляю прошлые скрины..."
    sleep 2
    sudo timeshift --delete-all
    echo "Удаление прошло успешно!"
    sleep 1
    echo "Начало скрина системы..."
    set now (date "+%d-%m-%Y %H:%M:%S")
    sudo timeshift --create --comments "Бэкап за $now"
    echo "Скрин успешно создан!"
end

function update
    yay -Syu
end

function helloworldPrint
    for i in (seq 1 100)
        echo LARP
    end
end

function cheat
    curl https://cheat.sh/$argv
end
