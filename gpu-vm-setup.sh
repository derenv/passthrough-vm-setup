#!/usr/bin/env bash

##
# GPU-Passthrough VM Setup Script
#
# Deren Vural
#
# 11/09/2022
##

# Options
STEAM=0
STEAM_FLATPAK=0
UTILITIES=1

# Updates
sudo apt update
sudo apt upgrade
sudo apt autoclean
sudo apt autoremove

# Utility programs
if [[ "$UTILITIES" -eq 1 ]]; then
    #aria2 - modern wget/cURL alternative
    #git - source control
    sudo apt install git aria2

    # oh-my-bash
    bash -c "$(aria2c https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)"
fi

# For drivers
sudo apt install nvidia-driver-515 nvidia-utils-515 nvidia-settings
sudo nvidia-xconfig # This creates a config file, needed for external monitor

if [[ "$STEAM_FLATPAK" -eq 1 ]]; then
    # For Steam
    sudo apt install flatpak gnome-software-plugin-flatpak gnome-software
    flatpak install com.valvesoftware.Steam
elif [[ "$STEAM" -eq 1 ]]; then
    # For Steam
    sudo apt install steam-installer
fi
