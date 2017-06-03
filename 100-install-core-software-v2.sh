#!/bin/bash
set -e
##################################################################################################################
# Written to be used on 64 bits computers
# Author 	: 	Erik Dubois
# Website 	: 	http://www.erikdubois.be
##################################################################################################################
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

#software from 'normal' repositories
sudo pacman -S --noconfirm --needed archey3 baobab bleachbit clementine 
sudo pacman -S --noconfirm --needed darktable dconf-editor
sudo pacman -S --noconfirm --needed evolution
sudo pacman -S --noconfirm --needed geary gnome-disk-utility 
sudo pacman -S --noconfirm --needed grsync
sudo pacman -S --noconfirm --needed hddtemp  
sudo pacman -S --noconfirm --needed notify-osd pinta
sudo pacman -S --noconfirm --needed ristretto screenfetch shotwell 
sudo pacman -S --noconfirm --needed simple-scan sysstat 
sudo pacman -S --noconfirm --needed transmission-cli
sudo pacman -S --noconfirm --needed vnstat unclutter  


sudo systemctl enable vnstat
sudo systemctl start vnstat

###############################################################################################

# installation of zippers and unzippers
sudo pacman -S --noconfirm --needed unace sharutils  uudeview  arj cabextract 

###############################################################################################


echo "################################################################"
echo "###################    core software installed  ################"
echo "################################################################"

