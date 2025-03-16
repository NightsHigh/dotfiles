#!/bin/bash

notification_icon="$HOME/dotfiles/links/.config/icons/wallpaper.svg"
wallpaper_directory="$HOME/Wallpapers"
rofi_theme="$HOME/dotfiles/links/.config/rofi/settings/wallpaper-selector.rasi"
waybar_launcher="$HOME/dotfiles/links/.config/hypr/scripts/launch-waybar.sh"
SWWW_PARAMS="--transition-fps 60 --transition-type any --transition-duration 2 --transition-bezier .43,1.19,1,.4"

getWallpaperSizes() {
    focused_monitor=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')
    scale_factor=$(hyprctl monitors -j | jq -r --arg mon "$focused_monitor" '.[] | select(.name == $mon) | .scale')
    monitor_height=$(hyprctl monitors -j | jq -r --arg mon "$focused_monitor" '.[] | select(.name == $mon) | .height')

    icon_size=$(echo "scale=1; ($monitor_height * 3) / ($scale_factor * 150)" | bc)
    adjusted_icon_size=$(echo "$icon_size" | awk '{if ($1 < 15) $1 = 20; if ($1 > 25) $1 = 25; print $1}')

    echo "element-icon{size:${adjusted_icon_size}%;}"
}

fetchWallpapers() {
    find -L "$wallpaper_directory" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.webp" -o -iname "*.bmp" -o -iname "*.tiff" \) -print0
}

change_wallpaper() {
    local image="$1"
    
    swww img "$image" $SWWW_PARAMS
    rm "$wallpaper_directory/.current"
    ln -s "$image" "$HOME/Wallpapers/.current"
    wallust run "$image"


    # Start waybar again
    bash "$waybar_launcher" &
    swaync-client -rs

    notify-send -t 6000 -i "$notification_icon" "Wallpaper changed" "$(basename "$image")" 



}


menu() {
    # wallpaper_arr is passed correctly as a list of wallpapers
    local wallpaper_arr=("$@")  # Accepts an array of wallpapers as arguments

    for pic_path in "${wallpaper_arr[@]}"; do
        pic_name=$(basename "$pic_path")

        # Displaying .gif to indicate animated images
        if [[ ! "$pic_name" =~ \.gif$ ]]; then
            printf "%s\x00icon\x1f%s\n" "$(echo "$pic_name" | cut -d. -f1)" "$pic_path"
        else
            printf "%s\n" "$pic_name"
        fi
    done
}

main() {
    rofi_overrides=$(getWallpaperSizes)
    rofi_command="rofi -dmenu -config "$rofi_theme" -theme-str "$rofi_overrides""

    # Fetch wallpapers into an array
    wallpaper_arr=()
    while IFS= read -r -d '' file; do
        wallpaper_arr+=("$file")
    done < <(fetchWallpapers)

    # Now pass the wallpaper array to the menu
    selected_wallpaper=$(menu "${wallpaper_arr[@]}" | $rofi_command)
    # Now find the full path by using the selected name to search through the array
    #
      # Check if nothing was selected (empty selection)
    if [[ -z "$selected_wallpaper" ]]; then
        echo "No wallpaper selected."
        exit 0
    fi

    pic_index=-1
    for i in "${!wallpaper_arr[@]}"; do
        filename=$(basename "${wallpaper_arr[$i]}")
        if [[ "$filename" == "$selected_wallpaper"* ]]; then
            pic_index=$i
            break
        fi
    done


    echo $pic_index
    # Get the full path of the selected wallpaper
    if [[ "$pic_index" -ge 0 ]]; then
        selected_wallpaper_full_path="${wallpaper_arr[$pic_index]}"
        echo "Selected wallpaper: $selected_wallpaper_full_path"
        
        # Proceed to change the wallpaper if a valid one is selected
        change_wallpaper "$selected_wallpaper_full_path"
    else
        echo "No valid wallpaper selected."
        exit 1
    fi

}

main
#
# # Sorting Wallpapers
# menu() {
#   # Sort the PICS array
#   IFS=$'\n' sorted_options=($(sort <<<"${PICS[*]}"))
#   
#   for pic_path in "${sorted_options[@]}"; do
#     pic_name=$(basename "$pic_path")
#     
#     # Displaying .gif to indicate animated images
#     if [[ ! "$pic_name" =~ \.gif$ ]]; then
#       printf "%s\x00icon\x1f%s\n" "$(echo "$pic_name" | cut -d. -f1)" "$pic_path"
#     else
#       printf "%s\n" "$pic_name"
#     fi
#   done
# }
#
# # initiate swww if not running
# swww query || swww-daemon --format xrgb
#
# change_wallpaper() {
#         swww img "${PICS[$pic_index]}" $SWWW_PARAMS
#     rm "$HOME/Wallpapers/.current"
#     ln -s "${PICS[$pic_index]}" "$HOME/Wallpapers/.current"
#     wallust run "${PICS[$pic_index]}"
#
#
#     # Start waybar again
#     bash "$HOME/dotfiles/links/.config/waybar/launch-waybar.sh" &
#     swaync-client -rs
#
#     notify-send -t 6000 -i "$HOME/dotfiles/links/.config/icons/wallpaper.svg" "Wallpaper changed" "$WALLPAPER"
#
#
#
# }
#
# # Choice of wallpapers
# main() {
#   choice=$(menu | $rofi_command)
#   
#   choice=$(echo "$choice" | xargs)
#
#   # No choice case
#   if [[ -z "$choice" ]]; then
#     echo "No choice selected. Exiting."
#     exit 0
#   fi
#
#   pic_index=-1
#   for i in "${!PICS[@]}"; do
#     filename=$(basename "${PICS[$i]}")
#     if [[ "$filename" == "$choice"* ]]; then
#       pic_index=$i
#       break
#     fi
#   done
#
#   if [[ $pic_index -ne -1 ]]; then
#     swww img "${PICS[$pic_index]}" $SWWW_PARAMS
#     rm "$HOME/Wallpapers/.current"
#     ln -s "${PICS[$pic_index]}" "$HOME/Wallpapers/.current"
#     wallust run "${PICS[$pic_index]}"
#
#
#     # Start waybar again
#     bash "$HOME/dotfiles/links/.config/waybar/launch-waybar.sh" &
#     swaync-client -rs
#
#     notify-send -t 6000 -i "$HOME/dotfiles/links/.config/icons/wallpaper.svg" "Wallpaper changed" "$WALLPAPER"
#
#   else
#     echo "Image not found."
#     exit 1
#   fi
#
# }
#
# # Check if rofi is already running
# if pidof rofi > /dev/null; then
#   pkill rofi
# fi
#
# main
#
#echo getWalpaperImages
