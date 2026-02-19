#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

mapfile -t packages < <(grep -v '^#' "./base.packages" | grep -v '^$')
paru -S --noconfirm --needed "${packages[@]}"

~/dotfiles/install/first-run/elephant.sh
~/dotfiles/install/login/all.sh

ICON_DIR="$HOME/.local/share/applications/icons"
mkdir -p "$ICON_DIR"
cp ~/dotfiles/*.png "$ICON_DIR/"

mkdir -p ~/.local/share/fonts
cp ~/dotfiles/config/omarchy.ttf ~/.local/share/fonts/
fc-cache

ln -sf ~/dotfiles/config/nvim ~/.config/nvim
ln -sf ~/dotfiles/config/hypr ~/.config/hypr
cp ~/dotfiles/config/bashrc ~/.bashrc
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

# Setup user theme folder
mkdir -p ~/.config/themes

# Set initial theme
omarchy-theme-set "Tokyo Night"
rm -rf ~/.config/chromium/SingletonLock # otherwise archiso will own the chromium singleton

# Set specific app links for current theme
mkdir -p ~/.config/btop/themes
ln -snf ~/.config/current/theme/btop.theme ~/.config/btop/themes/current.theme

mkdir -p ~/.config/mako
ln -snf ~/.config/current/theme/mako.ini ~/.config/mako/config

# Add managed policy directories for Chromium and Brave for theme changes
sudo mkdir -p /etc/chromium/policies/managed
sudo chmod a+rw /etc/chromium/policies/managed

sudo mkdir -p /etc/brave/policies/managed
sudo chmod a+rw /etc/brave/policies/managed


