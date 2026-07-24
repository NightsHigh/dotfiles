-- ~/.config/hypr/hyprland.lua
-- Modular Lua config. Load order mirrors the old hyprland.conf.
-- Colors are pulled lazily by the modules that need them via
-- `require("conf.colors")` (a safe wrapper around the wallust-generated file).

-- Environment
require("conf.environment")

-- Autostart
require("conf.autostart")

-- Plugins
require("conf.plugin_settings")

-- Keyboard and bindings
require("conf.keybindings")
require("conf.keyboard")

-- Monitor configuration (machine-specific; may be absent on a fresh machine).
-- pcall keeps a missing file non-fatal -> Hyprland just auto-detects monitors.
pcall(require, "monitors")
pcall(require, "workspaces")

-- Hyprland UI config
require("conf.window")
require("conf.decorations")
require("conf.animations")
require("conf.layout")
require("conf.window-rules")
require("conf.misc")
