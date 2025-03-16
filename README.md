# Dotfiles

My dotfile configuration for Arch Linux and Hyprland.

![Desktop Screenshot](https://github.com/eske4/dotfiles/blob/main/images/Desktop.png)
![Desktop Screenshot](https://github.com/eske4/dotfiles/blob/main/images/Desktop_launcher.png)

---

## Desktop Configuration

Follow these steps to set up your desktop environment:

### Step 1: Clone repo

1. Leave Root:
   `su your-username`
2. Clone repo to
   `git clone https://github.com/eske4/dotfiles.git ~/dotfiles`

### Step 2: Configure Hyprland Environment

1. Navigate to `~/dotfiles/home/.config/hypr/conf/environment.conf`.
2. By default, this file is set up for Nvidia. If you're not using an Nvidia card, follow the comments in the file to disable Nvidia-specific settings.

### Step 3: Run installation script

1. Change to the `dotfiles` directory: `cd ~/dotfiles`
2. Give execution permission to the setup script `chmod +x run_setup.sh`
3. Execute the installation script `run_setup.sh
`

### Step 4: Set Background: Optional

1. To set the background, click the gallery icon in the bar at the top-right corner.
2. To add more wallpapers, navigate to `~/dotfiles/links/Wallpapers` and place your desired images there.

---

## Dependencies

- **Waybar**: Status bar for Hyprland
- **GTK**: Graphical toolkit
- **Sddm-git**: Login display manager
- **Kitty**: Terminal emulator
- **Hyprland-git**: Desktop environment
- **Hyprsunset**: Bluefilter + Brightness
- **Hyprpolkitagent**: Application permissions
- **Hypridle**: Inactivity handler
- **Hyprlock**: Lock screen
- **SWWW**: Wallpaper engine
- **Rofi**: Wallpaper, app-launcher etc
- **UDiskie**: External drive manager
- **Pipewire**: Audio engine
- **Wireplumber**: Pipewire session manager
- **Pavucontrol**: Audio control UI
- **Slurp** and **Grim**: Screenshot system
- **Cliphist**: Clipboard manager
- **Wallust**: Theming tool
- **Wpgtk**: Pywal manager
- **SwayNc**: Notification center
- **UPower**: Power management tool
- **Tofi**: Applauncher
- **Swappy**: Screenshot editor
- **Nwg**: GTK manager ui
- **Starship** Terminal tool
- **ZSH**: Shell enviroment

---

## My Shortcuts

`mainMod` refers to the **Windows key** (depending on your keyboard).

- `mainMod + T`: Open the terminal
- `mainMod + Q`: Close the application
- `mainMod + M`: Exit Hyprland
- `mainMod + E`: Open the file manager
- `mainMod + F`: Open the file manager
- `mainMod + SPACE`: Open the application launcher
- `mainMod + F11`: Toggle full-screen mode
- `mainMod + B`: Open the browser

### Window Management

- `mainMod + SHIFT + h, j, k, l`: Resize a window left, down, up, or right
- `mainMod + right_mouse_click`: Resize a window with the mouse
- `mainMod + h, j, k, l`: Shift window focus left, down, up, or right
- `mainMod + mouse_up/down`: Scroll through workspaces

### Workspace Management

- `mainMod + V`: Open clipboard history
- `mainMod + 1-10`: Toggle between workspaces 1-10
- `mainMod + Shift + 1-10`: Move a window to workspace 1-10

### Special Workspace

- `mainMod + S`: Go to special workspace
- `mainMod + SHIFT + S`: Move window to special workspace

### Other Shortcuts

- `alt + tab`: Window switch **Rofi**
- `mainMod + tab`: Desktop overview with **hyprexpo**
- `prtsc`: Screenshot with **Grim**, **Slurp**, and **Swappy**
- Volume and brightness adjustments using **Fn** key

---

## Bugs

- No major bugs reported so far. If any appear, they haven't been noticed yet.

---

## TODO

- [x] Setup SDDM(Simple Desktop Display Manager).
- [x] Script to symlink even when the file and structure already exists.
- [x] Customize login screen ui
- [x] Restyle Hyprlock
- [x] Fix Hyprlock style when using gif as background
- [x] Themed Waybar
- [x] Themed SwayNC
- [x] Themed Wlogout
- [x] Wallpaper bug fixed, can now change wallpaper while neovim is open
- [ ] Update brightness UI in Waybar to integrate with Hyprsunset.
- [x] Customize to a prettier application launcher
- [x] Add custom login manager theme.

---

## Requirement

- **Storage**: Approximately **30GB** for the dotfiles and Linux installation (this may vary depending on the number of kernels installed).
