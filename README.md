# Hyprland config files from Titus


## Install

### Yay

Run as user NOT ROOT!

```
git clone https://aur.archlinux.org/yay-bin
cd yay-bin
makepkg -si
```

### Packages

```
yay -S hyprland-bin polkit-gnome ffmpeg neovim viewnior dunst rofi pavucontrol thunar starship wl-clipboard wf-recorder swaybg grimblast-git ffmpegthumbnailer tumbler playerctl noise-suppression-for-voice thunar-archive-plugin kitty waybar-hyprland wlogout swaylock-effects sddm-git nwg-look-bin nordic-theme papirus-icon-theme pamixer
```

## Gotchas

- Recommend archinstall with Sway as desktop for base
- SDDM-GIT is required or you will run into shutdown bugs and delays
- SDDM needs to be configured for autologin (recommend using swaylock on start of script for security)

## Bugs

- Hyprland is still in beta (0.2) as of the creation of these dot files
- Sometimes my RX5700XT goes to sleep and requires a reload, because it is stuck on black screen.

## Work In Progress

- [ ] Help Popup with Hotkey
- [ ] Wayland guide for nwg-look, wlr-randr, etc.
- [ ] Synergy Workaround - Looking at waynergy or just using KVM
- [ ] Gamescope Addition - Adding more parity with Steamdeck features
- [ ] More Customizations for Waybar - Battery, Backlight, etc.
- [ ] Auto-configuration - Long term goal

## Sources used making these

- Official Hyprland Github <https://github.com/hyprwm/Hyprland>
- Linux Mobiles Hyprland dot files <https://github.com/linuxmobile/hyprland-dots>
