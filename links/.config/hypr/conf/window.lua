-- ~/.config/hypr/conf/window.lua
-- General look (gaps, borders, layout). Colors come from the wallust module.

local colors = require("conf.colors")

hl.config({
	general = {
		gaps_in = 2,
		gaps_out = 4,

		border_size = 2,

		-- FLAG: gradient color syntax in the Lua API is unverified.
		-- If borders look wrong, check the general.col.* stubs.
		["col.active_border"] = colors.active_border,
		["col.inactive_border"] = colors.background_str,

		resize_on_border = false,
		allow_tearing = false,

		layout = "dwindle",
	},
})
