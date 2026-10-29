-- MONITORS

hl.monitor({
	output = "eDP-1",
	mode = "1920x1080@144",
	position = "0x0",
	scale = 1,
})

-- PROGRAMS VARS

local terminal = "kitty"
local fileManager = "thunar"
local menu = "wofi --show drun"
local browser = "zen-browser"
local mainMod = "SUPER"

-- ENVIRONMENT VARIABLES

hl.env("XCURSOR_SIZE", "16")
hl.env("HYPRCURSOR_SIZE", "16")

-- AUTOSTART

hl.on("hyprland.start", function()
	hl.exec_cmd("brightnessctl set 64000")
	hl.exec_cmd("thunar --daemon")
	hl.exec_cmd("env GDK_SCALE=2 GDK_DPI_SCALE=0.5 waybar & udiskie & awww-daemon")
	hl.exec_cmd("hiddify")
	hl.exec_cmd("swaync")
	hl.exec_cmd("clipse -listen")
	hl.exec_cmd("/usr/lib/xdg-desktop-portal-gtk")
	hl.exec_cmd("/usr/lib/xdg-desktop-portal")
end)

-- LOOK AND FEEL

hl.config({
	general = {
		gaps_in = 2,
		gaps_out = 0,

		border_size = 1,

		col = {
			active_border = "rgb(170,170,170)",
			inactive_border = "rgb(100,100,100)",
		},

		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},

	decoration = {
		rounding = 0,
		rounding_power = 2.0,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = false,
	},

	master = {
		new_status = "master",
	},

	misc = {
		force_default_wallpaper = -1,
		disable_hyprland_logo = true,
	},

	render = {
		direct_scanout = false,
	},
})

-- Bezier
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

-- INPUT
hl.config({
	input = {
		kb_layout = "us, ru",
		kb_variant = "",
		kb_model = "",
		kb_options = "grp:alt_shift_toggle",
		kb_rules = "",

		follow_mouse = 1,
		sensitivity = -0.8,

		touchpad = {
			natural_scroll = true,
		},
	},
})

-- Отключение тачпада при запуске
hl.device({
	name = "asue120b:00-04f3:31c0-touchpad",
	enabled = false,
})

hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

-- KEYBINDINGS

-- Main
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("telegram-desktop"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("zen-browser"))

-- Clipse
hl.bind("SUPER + V", hl.dsp.exec_cmd("kitty --class clipse -e clipse"))

-- hyprshot
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region -o /home/wnd/screenshots --clipboard-only"))
hl.bind(mainMod .. " + F12", hl.dsp.exec_cmd("hyprshot -m output -o /home/wnd/screenshots --clipboard-only"))

-- kdblight
hl.bind(mainMod .. " + F7", hl.dsp.exec_cmd("brightnessctl --device='asus::kbd_backlight' set 100%"))
hl.bind(mainMod .. " + F6", hl.dsp.exec_cmd("brightnessctl --device='asus::kbd_backlight' set 0%"))

-- brightness
hl.bind(mainMod .. " + F5", hl.dsp.exec_cmd("brightnessctl set 64500"))
hl.bind(mainMod .. " + F4", hl.dsp.exec_cmd("brightnessctl set 10000"))

-- Waybar toggle
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"))

-- Громкость (через mainMod + Fx)
hl.bind(mainMod .. " + F3", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%+"))
hl.bind(mainMod .. " + F2", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%-"))
hl.bind(mainMod .. " + F1", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 0%"))

-- Смена обоев
hl.bind("SUPER + A", hl.dsp.exec_cmd("fish -c '~/.config/hypr/set-wallpaper.fish'"))

-- Тачпад вкл/выкл + переключение чувствительности (mousemode/touchpadmode)

-- F8: выкл тачпад
hl.bind(
	"SUPER + F8",
	hl.dsp.exec_cmd(
		"fish -c \"hyprctl eval 'hl.device({ name=\\\"asue120b:00-04f3:31c0-touchpad\\\", enabled=false })'; and hyprctl eval 'hl.config({ input = { sensitivity = -0.8 } })'\""
	)
)
-- F9: вкл тачпад
hl.bind(
	"SUPER + F9",
	hl.dsp.exec_cmd(
		"fish -c \"hyprctl eval 'hl.device({ name=\\\"asue120b:00-04f3:31c0-touchpad\\\", enabled=true })'; and hyprctl eval 'hl.config({ input = { sensitivity = 0 } })'\""
	)
)

-- Перемещение фокуса стрелками
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Переключение воркспейсов
for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Мультимедийные клавиши ноутбука
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- WINDOWS AND WORKSPACES

-- Fullscreen для zen-browser
hl.window_rule({
	match = { class = "^(zen)$" },
	fullscreen = true,
})

-- Fullscreen для Teleagram
hl.window_rule({
	match = { class = "^(org.telegram.desktop)$" },
	fullscreen = true,
})

-- Clipse
hl.window_rule({
	match = { class = "clipse" },
	float = true,
	size = { 622, 652 },
})

hl.window_rule({
	match = { class = ".*" },
	suppress_event = "maximize",
})

-- Fix XWayland drag issues (If there a problem remove this comment section)
-- hl.window_rule({
--     match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
--     no_focus = true,
-- })
