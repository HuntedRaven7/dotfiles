#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

mapfile -t packages < <(grep -v '^#' "./base.packages" | grep -v '^$')
paru -S --noconfirm --needed "${packages[@]}"

~/dofiles/install/first-run/firewall.sh
~/dofiles/install/first-run/elephant.sh
~/dotfiles/install/login/all.sh

ICON_DIR="$HOME/.local/share/applications/icons"
mkdir -p "$ICON_DIR"
cp ~/dotfiles/*.png "$ICON_DIR/"

mkdir -p ~/.local/share/fonts
cp ~/dotfiles/config/omarchy.ttf ~/.local/share/fonts/
fc-cache

ln -sf ~/dotfiles/config/nvim ~/.config/nvim
ln -sf ~/dotfiles/config/hypr ~/.config/hypr
ln -sf ~/dotfiles/bashrc ~/.bashrc
ln -sf ~/dotfiles/config/uwsm ~/.config/uwsm
ln -sf ~/dotfiles/config/walker ~/.config/walker
ln -sf ~/dotfiles/config/systemd ~/.config/systemd
ln -sf ~/dotfiles/config/wireplumber ~/.config/wireplumber
ln -sf ~/dotfiles/config/swayosd ~/.config/swayosd
ln -sf ~/dotfiles/config/mako ~/.config/mako
ln -sf ~/dotfiles/config/starship.toml ~/.config/starship.toml
ln -sf ~/dotfiles/config/ghostty ~/.config/ghostty
ln -sf ~/dotfiles/config/btop ~/.config/btop
ln -sf ~/dotfiles/config/fastfetch ~/.config/fastfetch
ln -sf ~/dotfiles/config/fcitx5 ~/.config/fcitx5
ln -sf ~/dotfiles/config/xcompose ~/.Xcompose
