#!/usr/bin/env bash

usage() {
  echo "please only enter either y or n"
  install_or_skip $1 $2 $3
}

install_or_skip() {
  echo "$1 $2? y/n"
  read -r answer
  if [ $answer = "y" ]; then
    echo "$1ing $2"
    eval $3
  elif [ $answer = "n" ]; then 
    echo "Skipping $2"
  else usage $1 $2 $3
  fi
}
sudo apt update
sudo apt-get install curl

install_or_skip "Set" "touchpad scrolling direction up=up and down=down" "gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false"
install_or_skip "Set" "click on start bar minimizes or previews" "gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'"
install_or_skip "Set" "dark mode/theme" "gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'"

install_or_skip "Install" "vscode" "sudo snap install --classic code"
install_or_skip "Install" "microsoft teams" "sudo snap install --classic teams-for-linux"
install_or_skip "Install" "postman" "sudo snap install --classic postman"
install_or_skip "Install" "microsoft edge" "curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg; sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/; sudo sh -c 'echo \"deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main\" > /etc/apt/sources.list.d/microsoft-edge-dev.list'; sudo rm microsoft.gpg; sudo apt update; sudo apt-get install microsoft-edge-stable"
install_or_skip "Install" "gnome tweaks" "sudo add-apt-repository universe; sudo apt-get install gnome-tweaks"
