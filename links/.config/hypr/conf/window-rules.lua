-- ~/.config/hypr/conf/window-rules.lua
-- Ported from window-rules.conf. Every rule was commented out in the original,
-- so all are left disabled here too. Uncomment to enable.

-- ======================
-- Floating Window Rules
-- ======================
-- hl.window_rule({
-- 	match = { class = "^(blueman-manager|nm-connection-editor|steam|org.pulseaudio.pavucontrol|io.missioncenter.MissionCenter|nwg-displays|nwg-look|virt-manager)$" },
-- 	float = true,
-- })

-- ======================
-- Window Size Rules
-- ======================
-- hl.window_rule({
-- 	match = { class = "^(org.pulseaudio.pavucontrol|io.missioncenter.MissionCenter|blueman-manager|nm-connection-editor)$" },
-- 	size = { "50%", "50%" },
-- })
-- hl.window_rule({
-- 	match = { class = "^(virt-manager)$", title = "^(.*Virtual Machine.*)$" },
-- 	size = { "50%", "50%" },
-- })

-- ======================
-- Center Windows
-- ======================
-- hl.window_rule({ match = { class = "^(obsidian|steam)$" }, center = true })

-- ======================
-- Hyprbars Disabling (plugin rule — verify syntax)
-- ======================
-- hl.window_rule({
-- 	match = { class = "^(steam|io.missioncenter.MissionCenter|firefox|kitty|LibreWolf)$" },
-- 	plugin = { hyprbars = "nobar" },
-- })

-- ======================
-- Workspace Assignments
-- ======================
-- hl.window_rule({ match = { class = "^(kitty|Code|vscodium)$" }, workspace = "1" })
-- hl.window_rule({ match = { class = "^(obsidian)$" }, workspace = "special:note" })
-- hl.window_rule({ match = { class = "^(firefox|chromium|LibreWolf)$" }, workspace = "2" })
-- hl.window_rule({ match = { class = "^(steam)$" }, workspace = "3" })
-- hl.window_rule({ match = { class = "^(discord)$" }, workspace = "4" })
-- hl.window_rule({ match = { class = "^(com.bitwig.BitwigStudi|krita)$" }, workspace = "5" })
-- hl.window_rule({ match = { class = "^(virt-manager|VirtualBox|vmware|qemu)$" }, workspace = "6" })

-- ======================
-- Special Behaviors
-- ======================
-- hl.window_rule({ match = { class = "^(steam_app)" }, immediate = true })
-- hl.window_rule({
-- 	match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
-- 	no_focus = true,
-- })
-- hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" })
