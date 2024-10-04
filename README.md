# Hyprland Configuration Files by Titus

![Screenshot](https://github.com/ChrisTitusTech/hyprland-titus/raw/main/hyprland-titus.png)

## Installation

Ensure base-devel is installed before proceeding

### Paru

**Important**: Execute the following commands as a regular user, NOT as root!

```
git clone https://aur.archlinux.org/paru-bin
cd paru-bin
makepkg -si
```

### Required Packages

``` bash
paru -S hyprland mate-polkit ffmpeg neovim viewnior rofi pavucontrol thunar starship wl-clipboard wf-recorder swww grimblast-git ffmpegthumbnailer tumbler playerctl noise-suppression-for-voice thunar-archive-plugin alacritty aylurs-gtk-shell wlogout sddm pamixer nwg-look nordic-theme papirus-icon-theme dunst noto-fonts noto-fonts-emoji brightnessctl hyprpicker-git hyprlock xorg-xhost
```
- If you are getting **[error 4 related with payload and client.cpp](https://github.com/Alexays/Waybar/issues/2159)** while building waybar-hyprland-git download PKGBUILD and enter this code in build() section:
``` sed -i '10 i #include <stdexcept>\n#include <string>' include/modules/sway/ipc/client.hpp ``` then build (```makepkg -si```)


## Important Notes

- It is recommended to use `archinstall` with no desktop environment for the base installation.
- Configure SDDM for autologin (for security, use `swaylock` at the beginning of the script).
- Replace `xdg-desktop-portal-wlr` with **[xdg-desktop-portal-hyprland-git](https://wiki.hyprland.org/hyprland-wiki/pages/Useful-Utilities/Hyprland-desktop-portal/)**.

## Known Issues

- Occasionally, the RX5700XT may go to sleep and require a reload due to a stuck black screen.

## Roadmap

- [x] Hotkey for Help Popup
- [ ] Wayland guide for nwg-look, wlr-randr, etc.
- [ ] Synergy Workaround - Exploring lan-mouse, waynergy or KVM usage
- [ ] Gamescope Integration - Enhancing compatibility with Steamdeck features
- [x] Additional Customizations for Waybar - Battery, Backlight, etc.
- [ ] Automatic Configuration - Long-term goal

## References

- Official Hyprland GitHub: <https://github.com/hyprwm/Hyprland>
- Linux Mobiles Hyprland Configuration Files: <https://github.com/linuxmobile/hyprland-dots>
