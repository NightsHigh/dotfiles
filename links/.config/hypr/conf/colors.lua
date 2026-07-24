-- ~/.config/hypr/conf/colors.lua
-- Safe accessor for wallust-generated colors. Returns the generated module
-- (conf/colors-hyprland.lua) if present, otherwise sane dark defaults, so the
-- Hyprland config never fails to load (e.g. first boot before wallust has run).
--
-- Usage: local colors = require("conf.colors")

local ok, generated = pcall(require, "conf.colors-hyprland")
if ok and type(generated) == "table" then
	return generated
end

return {
	wallpaper = "",

	-- ARGB integer form
	background = 0xff1a1a1a,
	foreground = 0xffd0d0d0,
	color0 = 0xff1a1a1a,
	color1 = 0xff5a5a5a,
	color2 = 0xff6a6a6a,
	color3 = 0xff7a7a7a,
	color4 = 0xff8a8a8a,
	color5 = 0xff9a9a9a,
	color6 = 0xffaaaaaa,
	color7 = 0xffc0c0c0,
	color8 = 0xff505050,
	color9 = 0xff707070,
	color10 = 0xff808080,
	color11 = 0xff9a9a9a,
	color12 = 0xffaaaaaa,
	color13 = 0xffbababa,
	color14 = 0xffcacaca,
	color15 = 0xffe0e0e0,

	-- String form
	background_str = "rgb(1a1a1a)",
	foreground_str = "rgb(d0d0d0)",
	color5_str = "rgb(9a9a9a)",
	color9_str = "rgb(707070)",
	active_border = "rgb(9a9a9a) rgb(9a9a9a) 45deg",
}
