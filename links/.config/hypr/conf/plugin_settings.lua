-- ~/.config/hypr/conf/plugin_settings.lua
-- hyprbars + hyprexpo settings.
--
-- Applied via `hyprctl keyword` on startup instead of hl.config: plugin
-- keywords register into Hyprland's classic parser, which the Lua config API
-- does not reach. This runs after plugins load and is the reliable channel.
-- Harmless (just prints an error) if a plugin isn't installed.

local colors = require("conf.colors")

hl.on("hyprland.start", function()
	-- hyprbars
	hl.exec_cmd("hyprctl keyword plugin:hyprbars:bar_height 35")
	hl.exec_cmd("hyprctl keyword plugin:hyprbars:bar_color " .. colors.background_str)
	hl.exec_cmd("hyprctl keyword plugin:hyprbars:col.text " .. colors.foreground_str)
	hl.exec_cmd("hyprctl keyword plugin:hyprbars:bar_text_font FiraCode")
	hl.exec_cmd("hyprctl keyword plugin:hyprbars:bar_text_size 12")
	hl.exec_cmd(
		'hyprctl keyword plugin:hyprbars:hyprbars-button "'
			.. colors.color9_str
			.. ', 15, 󰖭, hyprctl dispatch killactive"'
	)
	hl.exec_cmd(
		'hyprctl keyword plugin:hyprbars:hyprbars-button "'
			.. colors.color5_str
			.. ', 15, , hyprctl dispatch fullscreen 1"'
	)

	-- hyprexpo
	hl.exec_cmd("hyprctl keyword plugin:hyprexpo:columns 3")
	hl.exec_cmd("hyprctl keyword plugin:hyprexpo:gap_size 5")
	hl.exec_cmd("hyprctl keyword plugin:hyprexpo:bg_col " .. colors.background_str)
	hl.exec_cmd('hyprctl keyword plugin:hyprexpo:workspace_method "center current"')
	hl.exec_cmd("hyprctl keyword plugin:hyprexpo:enable_gesture true")
	hl.exec_cmd("hyprctl keyword plugin:hyprexpo:gesture_distance 300")
	hl.exec_cmd("hyprctl keyword plugin:hyprexpo:gesture_positive true")
end)
