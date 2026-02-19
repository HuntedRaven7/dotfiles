if [ "$(plymouth-set-default-theme)" != "omarchy" ]; then
  sudo cp -r "$HOME/dotfiles/config/plymouth/*" /usr/share/plymouth/themes/omarchy/
  sudo plymouth-set-default-theme omarchy
fi
