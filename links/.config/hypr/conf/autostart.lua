-- ~/.config/hypr/conf/autostart.lua

hl.on("hyprland.start", function()
	-- Misc
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("hyprpm reload -n")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("udiskie &")
	hl.exec_cmd("swaync &")

	-- Tray applications
	hl.exec_cmd("nm-applet &")
	hl.exec_cmd("blueman-applet &")
	hl.exec_cmd("swww-daemon")
	hl.exec_cmd("~/dotfiles/links/.config/hypr/scripts/launch-waybar.sh")

	-- Clipboard
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")

	-- Workflow
	hl.exec_cmd("[workspace special:note silent] obsidian")
	hl.exec_cmd("[workspace special:note silent] kitty ~/Obsidian")
	hl.exec_cmd("[workspace special:terminal silent] kitty")

	-- Initialization
	hl.exec_cmd("~/dotfiles/links/.config/hypr/scripts/initialize_once.sh &")
end)
