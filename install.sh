#!/bin/bash
_DotSymlink() {

	source="$1"
	shift
	PARSED=$(getopt -o '' --long to-home,to-config -- "$@")
	if [[ $? -ne 0 ]]; then
		exit 1
	fi
	eval set -- "$PARSED"

	target_dir=""
	while true; do
		case "$1" in
			--to-home)
			target_dir="$HOME"
			shift
			;;
			--to-config)
			target_dir="$HOME/.config"
			shift
			;;
			--)
			shift # End of options
			break
			;;
			*)
			echo "Invalid option: $1" >&2
			exit 1
			;;
		esac
	done

	target="$target_dir/$(basename $source)"

	if [ -L "${target}" ]; then
		# is a symlink
		rm ${target}
		ln -s ${source} ${target}
		echo ":: Symlink ${source} -> ${target} created."
	elif [ -d ${target} ]; then
		# is a dir
		rm -rf ${target}/
		ln -s ${source} ${target}
		echo ":: Symlink for directory ${source} -> ${target} created."
	elif [ -f ${target} ]; then
		# is a file
		rm ${target}
		ln -s ${source} ${target}
		echo ":: Symlink to file ${source} -> ${target} created."
	else
		ln -s ${source} ${target}
		echo ":: New symlink ${source} -> ${target} created."
	fi
}

pkgs=(
    brightnessctl
    cliphist
    eza
    hypridle
    hyprland
    hyprlock
    hyprshot
    hyprpaper
    pamixer
    rofi-wayland
    starship
    swaync
    waybar
    wlogout
    wob
    xdg-desktop-portal-hyprland
)
clear
echo ":: Dotfiles installation begins."
echo ":: Checking required packages..."
sleep 0.5
yay -S --needed "${pkgs[@]}"

dotfiles=$HOME/Dotfiles

_DotSymlink $dotfiles/alacritty --to-config
_DotSymlink $dotfiles/chromium/chromium-flags.conf --to-config
_DotSymlink $dotfiles/code/code.conf --to-config
_DotSymlink $dotfiles/gtk/gtk-3.0 --to-config
_DotSymlink $dotfiles/gtk/gtk-4.0 --to-config
_DotSymlink $dotfiles/gtk/xsettingsd --to-config
_DotSymlink $dotfiles/gtk/.gtkrc-2.0 --to-home
_DotSymlink $dotfiles/gtk/.Xresources --to-home
_DotSymlink $dotfiles/htop --to-config
_DotSymlink $dotfiles/hypr --to-config
_DotSymlink $dotfiles/nano/.nanorc --to-home
_DotSymlink $dotfiles/npm/.npmrc --to-home
_DotSymlink $dotfiles/R/.Rprofile --to-home
_DotSymlink $dotfiles/rofi --to-config
_DotSymlink $dotfiles/wlogout --to-config
_DotSymlink $dotfiles/starship/starship.toml --to-config
_DotSymlink $dotfiles/swaync --to-config
_DotSymlink $dotfiles/waybar --to-config
_DotSymlink $dotfiles/wlogout --to-config
_DotSymlink $dotfiles/zsh/.zshrc --to-home

echo ":: Done."
