# Dotfiles

My dotfile configuration for Arch Linux and Hyprland.

## Desktop Configuration

Follow these steps to set up your desktop environment:

### Step 1: Clone repo
1. Leave Root: `su your-username`
2. Clone repo to `git clone https://github.com/eske4/dotfiles.git`


### Step 2: Configure Hyprland Environment

1. Navigate to `~/dotfiles/home/.config/hypr/conf/environment.conf`.
2. Add Nvidia environment settings if you have an Nvidia graphics card, or skip this step if you do not.


### Step 3: Run installation script
1. Locate dotfiles with `cd ~/dotfiles`
2. Give execution permission `chmod +x run_setup.sh` 
3. Execute script `run_setup.sh
   `
### Step 3: Configure display

1. Open `Display Settings` with the app launcher. 
2. Ensure the scale is set to 1.
3. Set the screen size to maximum.

### Step 4: Set Background

1. Press the gallery icon in the bar at the right corner to set the background.

### Step 5: Add hyprpm plugin - if hyprland plugin system fail

Should be automatic else:

    1. `hyprpm add https://github.com/hyprwm/hyprland-plugins`
    2. `hyprpm enable hyprexpo`
    3. `hyprpm enable hyprbars`
## Dependencies

- **Waybar**: Bar UI
- **GTK**: Graphical toolkit
- **Sddm-git**: Display manager
- **Kitty**: Terminal emulator
- **Hyprland-git**: Desktop environment
- **Hyprsunset**: Bluefilter + Brightness
- **Hyprpolkitagent**: Application permissions
- **Hypridle**: Inactivity handler
- **Hyprlock**: Lock screen
- **SWWW**: Wallpaper engine
- **Waypaper**: Wallpaper changer UI
- **UDiskie**: External drive manager
- **Pipewire**: Audio engine
- **Wireplumber**: Pipewire session manager
- **Pavucontrol**: Audio control UI
- **Slurp** and **Grim**: Screenshot system
- **Cliphist**: Clipboard manager
- **Pywal**: Theming tool
- **Wpgtk**: Pywal manager
- **SwayNc**: Notification center
- **UPower**: Power management tool
- **Tofi**: Applauncher
- **Swappy**: Screenshot editor
- **Nwg**: GTK manager ui
- **Starship** Terminal tool
- **ZSH**: Shell

## Bugs

- None for now, probably somewhere but haven't noticed

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
- [ ] Update brightness ui in waybar to adapt Hyprsunset
- [ ] Add custom login manager theme

## Requirement

Storage around 30GB - For dotfiles and linux, depending on how many kernels etc

