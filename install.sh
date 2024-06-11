#!/bin/bash
_installSymLink() {
    symlink="$1"
    linksource="$2"
    linktarget="$3"

    if [ -L "${symlink}" ]; then
        # is a symlink
        rm ${symlink}
        ln -s ${linksource} ${linktarget}
        echo ":: Symlink ${linksource} -> ${linktarget} created."
    elif [ -d ${symlink} ]; then
        # is a dir
        rm -rf ${symlink}/
        ln -s ${linksource} ${linktarget}
        echo ":: Symlink for directory ${linksource} -> ${linktarget} created."
    elif [ -f ${symlink} ]; then
        # is a file
        rm ${symlink}
        ln -s ${linksource} ${linktarget}
        echo ":: Symlink to file ${linksource} -> ${linktarget} created."
    else
        ln -s ${linksource} ${linktarget}
        echo ":: New symlink ${linksource} -> ${linktarget} created."
    fi
}
pkgs=(
    hyprland
    hyprlock
    hypridle
    hyprpaper
    xdg-desktop-portal-hyprland
    rofi-wayland
    starship
    swappy
    grim
    waybar
    # dunst
    swaync
    wlogout
    eza
    cliphist
    # brightnessctl
    swayosd-git
    # power-profile-daemon
)
clear
echo ":: Dotfiles installation begins."
echo ":: Checking required packages..."
sleep 0.5
yay -S --needed "${pkgs[@]}"

_installSymLink $HOME/.config/alacritty $HOME/my-hypr/alacritty $HOME/.config
_installSymLink $HOME/.config/dunst $HOME/my-hypr/dunst $HOME/.config
_installSymLink $HOME/.config/hypr $HOME/my-hypr/hypr $HOME/.config
_installSymLink $HOME/.config/htop $HOME/my-hypr/htop $HOME/.config
_installSymLink $HOME/.config/rofi $HOME/my-hypr/rofi $HOME/.config
_installSymLink $HOME/.config/swappy $HOME/my-hypr/swappy $HOME/.config
_installSymLink $HOME/.config/waybar $HOME/my-hypr/waybar $HOME/.config
_installSymLink $HOME/.config/wlogout $HOME/my-hypr/wlogout $HOME/.config
_installSymLink $HOME/.config/starship.toml $HOME/my-hypr/starship/starship.toml $HOME/.config
_installSymLink $HOME/.config/gtk-3.0 $HOME/my-hypr/gtk/gtk-3.0 $HOME/.config
_installSymLink $HOME/.config/gtk-4.0 $HOME/my-hypr/gtk/gtk-4.0 $HOME/.config
_installSymLink $HOME/.config/xsettingsd $HOME/my-hypr/gtk/xsettingsd $HOME/.config
_installSymLink $HOME/.gtkrc-2.0 $HOME/my-hypr/gtk/.gtkrc-2.0 $HOME
_installSymLink $HOME/.Xresources $HOME/my-hypr/gtk/.Xresources $HOME
_installSymLink $HOME/.zshrc $HOME/my-hypr/.zshrc $HOME
_installSymLink $HOME/.config/swaync $HOME/my-hypr/swaync $HOME/.config

echo ":: Setting up GTK ..."
source ./hypr/scripts/gtk.sh > /dev/null
echo ":: Done."
