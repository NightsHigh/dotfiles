-- ~/.config/hypr/conf/window.lua
-- General look (gaps, borders, layout). Colors come from the wallust module.

local colors = require("conf.colors")

hl.config({
	general = {
		gaps_in = 2,
		gaps_out = 4,

		border_size = 2,

		-- Solid border colors (int form). The Lua API rejects the classic
		-- "rgb(a) rgb(b) 45deg" gradient string; re-add a gradient later once
		-- the table syntax is confirmed against /usr/share/hypr/stubs.
		["col.active_border"] = colors.color5,
		["col.inactive_border"] = colors.background,

		resize_on_border = false,
		allow_tearing = false,

		layout = "dwindle",
	},
})
