#!/bin/bash

# Define variables
git_pkgs="grimblast-git sddm-git hyprpicker-git gbar-git"
hypr_pkgs="hyprland wl-clipboard wf-recorder wlogout dunst hyprpaper hyprcursor hyprlang"    
font_pkgs="ttf-nerd-fonts-symbols-common otf-firamono-nerd inter-font otf-sora ttf-fantasque-nerd noto-fonts noto-fonts-emoji ttf-comfortaa"
font_pkgs2="ttf-jetbrains-mono-nerd ttf-icomoon-feather ttf-iosevka-nerd "
app_pkgs="nwg-look-bin gvfs ffmpegthumbs swww mpv playerctl pamixer noise-suppression-for-voice"
app_pkgs2="polkit-gnome viewnior ffmpegthumbnailer tumbler "

# Check for yay or paru
if command -v yay &> /dev/null; then
    aur_helper="yay"
elif command -v paru &> /dev/null; then
    aur_helper="paru"
else
    echo "Neither yay nor paru found. Please install one of them to continue."
    exit 1
fi

# Function to uninstall packages
uninstall_packages() {
    for pkg in "$@"; do
        if $aur_helper -Qi $pkg &> /dev/null; then
            if ! $aur_helper -R --noconfirm $pkg &> /dev/null; then
                echo "Failed to uninstall $pkg due to dependency issues or other errors."
            else
                echo "$pkg uninstalled successfully."
            fi
        else
            echo "$pkg is not installed."
        fi
    done
}

# Uninstall all packages
uninstall_packages $git_pkgs $hypr_pkgs $font_pkgs $font_pkgs2 $app_pkgs $app_pkgs2