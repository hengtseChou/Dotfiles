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
    avizo
    brightnessctl
    cliphist
    eza
    grim
    hypridle
    hyprland
    hyprlock
    hyprpaper
    pamixer
    rofi-wayland
    starship
    swappy
    swaync
    waybar
    wlogout
    xdg-desktop-portal-hyprland
)
clear
echo ":: Dotfiles installation begins."
echo ":: Checking required packages..."
sleep 0.5
yay -S --needed "${pkgs[@]}"

config=$HOME/.config
dotfiles=$HOME/Dotfiles

_installSymLink $config/alacritty $dotfiles/alacritty $config
_installSymLink $config/dunst $dotfiles/dunst $config
_installSymLink $config/hypr $dotfiles/hypr $config
_installSymLink $config/htop $dotfiles/htop $config
_installSymLink $config/rofi $dotfiles/rofi $config
_installSymLink $config/swappy $dotfiles/swappy $config
_installSymLink $config/waybar $dotfiles/waybar $config
_installSymLink $config/wlogout $dotfiles/wlogout $config
_installSymLink $config/starship.toml $dotfiles/starship/starship.toml $config
_installSymLink $config/gtk-3.0 $dotfiles/gtk/gtk-3.0 $config
_installSymLink $config/gtk-4.0 $dotfiles/gtk/gtk-4.0 $config
_installSymLink $config/xsettingsd $dotfiles/gtk/xsettingsd $config
_installSymLink $HOME/.gtkrc-2.0 $dotfiles/gtk/.gtkrc-2.0 $HOME
_installSymLink $HOME/.Xresources $dotfiles/gtk/.Xresources $HOME
_installSymLink $HOME/.zshrc $dotfiles/.zshrc $HOME
_installSymLink $config/swaync $dotfiles/swaync $config

echo ":: Setting up GTK ..."
source ./hypr/scripts/reload-gtk.sh >/dev/null
echo ":: Done."
