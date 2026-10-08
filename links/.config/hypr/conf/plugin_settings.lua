-- ~/.config/hypr/conf/plugin_settings.lua
-- hyprbars settings.
--
-- hyprpm isn't available with hyprland-git, so hyprbars is built by hand from
-- https://github.com/hyprwm/hyprland-plugins (pick the commit matching the
-- Hyprland build date) and copied to ~/.local/lib/hyprland/hyprbars.so.
-- Rebuild it after every Hyprland update; a stale build refuses to load.
--
-- hyprexpo was dropped upstream (May 2026) and no longer exists.

local colors = require("conf.colors")

local hyprbars_so = os.getenv("HOME") .. "/.local/lib/hyprland/hyprbars.so"

local f = io.open(hyprbars_so, "r")
if f then
	f:close()
	pcall(hl.plugin.load, hyprbars_so)
end

-- Only configure if the plugin actually loaded, so a missing/stale build
-- doesn't break the rest of the config.
if hl.plugin.hyprbars then
	hl.config({
		plugin = {
			hyprbars = {
				bar_height = 35,
				bar_color = colors.background_str,
				["col.text"] = colors.foreground_str,
				bar_text_font = "FiraCode",
				bar_text_size = 12,
			},
		},
	})

	-- Buttons (right -> left)
	hl.plugin.hyprbars.add_button({
		bg_color = colors.color9_str,
		fg_color = colors.foreground_str,
		size = 15,
		icon = "󰖭",
		action = "hyprctl dispatch 'hl.dsp.window.close()'",
	})
	hl.plugin.hyprbars.add_button({
		bg_color = colors.color5_str,
		fg_color = colors.foreground_str,
		size = 15,
		icon = "",
		action = [[hyprctl dispatch 'hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" })']],
	})
end
