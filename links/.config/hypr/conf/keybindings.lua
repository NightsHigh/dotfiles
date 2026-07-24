-- ~/.config/hypr/conf/keybindings.lua

-- --------------------
-- Variables
-- --------------------
local mainMod = "SUPER"

local terminal = "kitty"
local fileManager = "dolphin"
local menu = "rofi -show drun -modi drun,filebrowser,window"
local command_viewer =
	[[rofi -show run -modi run -config "~/dotfiles/links/.config/rofi/menues/command-viewer.rasi"]]
local clipboard_viewer =
	[[cliphist list | rofi -dmenu -config "~/dotfiles/links/.config/rofi/menues/clipboard-viewer.rasi" -p '' | cliphist decode | wl-copy]]
local window_switcher =
	[[rofi -show window -modi window -config "~/dotfiles/links/.config/rofi/menues/window-selector.rasi"]]

-- --------------------
-- Apps & window actions
-- --------------------
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("code"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
-- togglesplit (dwindle): no confirmed hl.dsp mapping — routed via hyprctl to be safe.
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("hyprctl dispatch togglesplit"))
hl.bind("CONTROL + ALT + DELETE", hl.dsp.exec_cmd("missioncenter"))

-- NOTE: your old config bound SUPER + B twice (firefox above AND launch-waybar
-- below). Only one can win. Enable the one you want; left disabled to avoid a
-- silent conflict.
-- hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("~/dotfiles/links/.config/hypr/scripts/launch-waybar.sh"))

-- Danish characters (wtype)
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd([[wtype "å"]]))
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd([[wtype "Å"]]))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd([[wtype "ø"]]))
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.exec_cmd([[wtype "Ø"]]))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd([[wtype "æ"]]))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd([[wtype "Æ"]]))

-- Media & Brightness (bindel -> repeating)
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 5%+"), { repeating = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))

-- Screenshot
hl.bind("PRINT", hl.dsp.exec_cmd([[grim -g "$(slurp)" - | swappy -f -]]))

-- Move focus with mainMod + vim keys
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

-- Custom menus
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(clipboard_viewer))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(command_viewer))

-- Switch workspaces with mainMod + [1-9]
for i = 1, 9 do
	hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = tostring(i) }))
	hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = tostring(i) }))
end

-- Workspace 0 maps to workspace 10
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = "10" }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = "10" }))

-- Move workspace to another monitor
hl.bind(mainMod .. " + LEFT", hl.dsp.workspace.move({ monitor = "l" }))
hl.bind(mainMod .. " + RIGHT", hl.dsp.workspace.move({ monitor = "r" }))

-- Special workspaces (scratchpad)
hl.bind(mainMod .. " + D", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Mouse drag / resize
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Expo / window switcher
-- hyprexpo is a plugin dispatcher — routed via hyprctl (no confirmed hl.dsp entry).
hl.bind(mainMod .. " + tab", hl.dsp.exec_cmd("hyprctl dispatch hyprexpo:expo toggle"))
hl.bind("ALT + tab", hl.dsp.exec_cmd(window_switcher))

-- Resize active window with mainMod + SHIFT + vim keys (binde -> repeating)
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { repeating = true })

-- Workflow special workspaces
hl.bind(mainMod .. " + N", hl.dsp.workspace.toggle_special("note"))
hl.bind(mainMod .. " + RETURN", hl.dsp.workspace.toggle_special("terminal"))
