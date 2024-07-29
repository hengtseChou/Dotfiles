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
    swaync
    wlogout
    eza
    cliphist
    swayosd-git
)
clear
echo ":: Dotfiles installation begins."
echo ":: Checking required packages..."
sleep 0.5
yay -S --needed "${pkgs[@]}"

config=$config
my_hypr=$HOME/my-hypr

_installSymLink $config/alacritty $my_hypr/alacritty $config
_installSymLink $config/dunst $my_hypr/dunst $config
_installSymLink $config/hypr $my_hypr/hypr $config
_installSymLink $config/htop $my_hypr/htop $config
_installSymLink $config/rofi $my_hypr/rofi $config
_installSymLink $config/swappy $my_hypr/swappy $config
_installSymLink $config/waybar $my_hypr/waybar $config
_installSymLink $config/wlogout $my_hypr/wlogout $config
_installSymLink $config/starship.toml $my_hypr/starship/starship.toml $config
_installSymLink $config/gtk-3.0 $my_hypr/gtk/gtk-3.0 $config
_installSymLink $config/gtk-4.0 $my_hypr/gtk/gtk-4.0 $config
_installSymLink $config/xsettingsd $my_hypr/gtk/xsettingsd $config
_installSymLink $HOME/.gtkrc-2.0 $my_hypr/gtk/.gtkrc-2.0 $HOME
_installSymLink $HOME/.Xresources $my_hypr/gtk/.Xresources $HOME
_installSymLink $HOME/.zshrc $my_hypr/.zshrc $HOME
_installSymLink $config/swaync $my_hypr/swaync $config

echo ":: Setting up GTK ..."
source ./hypr/scripts/reload-gtk.sh >/dev/null
echo ":: Done."
