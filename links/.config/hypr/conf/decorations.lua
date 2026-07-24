-- ~/.config/hypr/conf/decorations.lua

local colors = require("conf.colors")

hl.config({
	decoration = {
		rounding = 5,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 2,
			render_power = 1,
			color = colors.background, -- ARGB integer
		},

		blur = {
			enabled = true,
			size = 0,
			passes = 2,
			vibrancy = 0.16,
		},
	},
})
