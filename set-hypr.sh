#!/bin/bash

# set some colors
CNT="[\e[1;36mNOTE\e[0m]"
COK="[\e[1;32mOK\e[0m]"
CER="[\e[1;31mERROR\e[0m]"
CAT="[\e[1;37mATTENTION\e[0m]"
CWR="[\e[1;35mWARNING\e[0m]"
CAC="[\e[1;33mACTION\e[0m]"
INSTLOG="install.log"

#### Check for yay ####
ISYAY=/sbin/yay
if [ -f "$ISYAY" ]; then 
    echo -e "$COK - yay was located, moving on."
    yay -Suy
else 
    echo -e "$CWR - Yay was NOT located"
    read -n1 -rep $'[\e[1;33mACTION\e[0m] - Would you like to install yay (y,n) ' INSTYAY
    if [[ $INSTYAY == "Y" || $INSTYAY == "y" ]]; then
        git clone https://aur.archlinux.org/yay-git.git 2>&1 | tee -a $LOG
        cd yay-git
        makepkg -si --noconfirm 2>&1 | tee -a $LOG
        cd ..
        
    else
        echo -e "$CER - Yay is required for this script, now exiting"
        exit
    fi
fi

### Install all of the above pacakges ####
read -n1 -rep 'Would you like to install the packages? (y,n)' INST
if [[ $INST == "Y" || $INST == "y" ]]; then
   git_pkgs="grimblast-git sddm-git"
   hypr_pkgs="hyprland waybar-hyprland wl-clipboard wf-recorder rofi wlogout swaylock-effects dunst swaybg kitty"    
   font_pkgs="ttf-nerd-fonts-symbols-common otf-firamono-nerd inter-font otf-sora ttf-fantasque-nerd noto-fonts noto-fonts-emoji ttf-comfortaa"
   font_pkgs2="ttf-jetbrains-mono-nerd ttf-icomoon-feather ttf-iosevka-nerd adobe-source-code-pro-fonts"
   app_pkgs="nwg-look-bin qt5ct btop jq gvfs ffmpegthumbs swww mousepad mpv  playerctl pamixer noise-suppression-for-voice"
   app_pkgs2="polkit-gnome ffmpeg neovim viewnior pavucontrol thunar ffmpegthumbnailer tumbler thunar-archive-plugin"
   theme_pkgs="nordic-theme papirus-icon-theme starship "

    yay -R --noconfirm swaylock waybar

    if ! yay -S --noconfirm $git_pkgs $hypr_pkgs $font_pkgs $font_pkgs2 $app_pkgs $app_pkgs2 $theme_pkgs 2>&1 | tee -a $LOG; then
        print_error " Failed to install additional packages - please check the install.log \n"
        exit 1
    fi

    echo
    print_success " All necessary packages installed successfully."
else
    echo
    print_error " Packages not installed - please check the install.log "
    sleep 1
fi


### Copy Config Files ###
read -n1 -rep 'Would you like to copy config files? (y,n)' CFG
if [[ $CFG == "Y" || $CFG == "y" ]]; then
    echo -e "Copying config files...\n"
    cp -R ./dotconfig/dunst ~/.config/ 2>&1 | tee -a $LOG
    cp -R ./dotconfig/hypr ~/.config/ 2>&1 | tee -a $LOG
    cp -R ./dotconfig/kitty ~/.config/ 2>&1 | tee -a $LOG
    cp -R ./dotconfig/pipewire ~/.config/ 2>&1 | tee -a $LOG
    cp -R ./dotconfig/rofi ~/.config/ 2>&1 | tee -a $LOG
    cp -R ./dotconfig/swaylock ~/.config/ 2>&1 | tee -a $LOG
    cp -R ./dotconfig/waybar ~/.config/ 2>&1 | tee -a $LOG
    cp -R ./dotconfig/wlogout ~/.config/ 2>&1 | tee -a $LOG
    
    # Set some files as exacutable 
    chmod +x ~/.config/hypr/xdg-portal-hyprland
    chmod +x ~/.config/waybar/scripts/waybar-wttr.py
fi

### Enable SDDM Autologin ###
read -n1 -rep 'Would you like to enable SDDM autologin? (y,n)' SDDM
if [[ $SDDM == "Y" || $SDDM == "y" ]]; then
    LOC="/etc/sddm.conf"
    echo -e "The following has been added to $LOC.\n"
    echo -e "[Autologin]\nUser = $(whoami)\nSession=hyprland" | sudo tee -a $LOC
    echo -e "\n"
    echo -e "Enable SDDM service...\n"
    sudo systemctl enable sddm
    sleep 3
fi


### Script is done ###
echo -e "Script had completed.\n"
echo -e "You can start Hyprland by typing Hyprland (note the capital H).\n"
read -n1 -rep 'Would you like to start Hyprland now? (y,n)' HYP
if [[ $HYP == "Y" || $HYP == "y" ]]; then
    exec Hyprland
else
    exit
fi
