# Hyprland Configuration Files by Titus

![Screenshot](https://github.com/ChrisTitusTech/hyprland-titus/raw/main/hyprland-titus.png)

## Installation

Ensure base-devel is installed before proceeding

### Yay

**Important**: Execute the following commands as a regular user, NOT as root!

```
git clone https://aur.archlinux.org/yay-bin
cd yay-bin
makepkg -si
```

### Required Packages

``` bash
yay -S hyprland polkit-gnome ffmpeg neovim viewnior rofi      \
pavucontrol thunar starship wl-clipboard wf-recorder swaybg   \
grimblast-git ffmpegthumbnailer tumbler playerctl             \
noise-suppression-for-voice thunar-archive-plugin kitty       \
waybar-hyprland wlogout swaylock-effects sddm-git pamixer     \
nwg-look-bin nordic-theme papirus-icon-theme dunst otf-sora   \
ttf-nerd-fonts-symbols-common otf-firamono-nerd inter-font    \
ttf-fantasque-nerd noto-fonts noto-fonts-emoji ttf-comfortaa  \
ttf-jetbrains-mono-nerd ttf-icomoon-feather ttf-iosevka-nerd  \
adobe-source-code-pro-fonts brightnessctl hyprpicker-git
```

## Important Notes

- It is recommended to use `archinstall` with Sway as the desktop environment for the base installation.
- `SDDM-GIT` is required to avoid shutdown bugs and delays.
- Configure SDDM for autologin (for security, use `swaylock` at the beginning of the script).
- Replace `xdg-desktop-portal-wlr` with **[xdg-desktop-portal-hyprland-git](https://wiki.hyprland.org/hyprland-wiki/pages/Useful-Utilities/Hyprland-desktop-portal/)**.

## Known Issues

- Hyprland is in beta (version 0.2) at the time of creating these configuration files.
- Occasionally, the RX5700XT may go to sleep and require a reload due to a stuck black screen.

## Roadmap

- [ ] Hotkey for Help Popup
- [ ] Wayland guide for nwg-look, wlr-randr, etc.
- [ ] Synergy Workaround - Exploring waynergy or KVM usage
- [ ] Gamescope Integration - Enhancing compatibility with Steamdeck features
- [x] Additional Customizations for Waybar - Battery, Backlight, etc.
- [ ] Automatic Configuration - Long-term goal

## References

- Official Hyprland GitHub: <https://github.com/hyprwm/Hyprland>
- Linux Mobiles Hyprland Configuration Files: <https://github.com/linuxmobile/hyprland-dots>
