#!/bin/bash
#
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

sudo pacman -S lib32-fontconfig  --needed --noconfirm
sudo pacman -S lib32-libpng12 --needed --noconfirm
sudo pacman -S lib32-libsm --needed --noconfirm
sudo pacman -S lib32-libxinerama --needed --noconfirm
sudo pacman -S lib32-libxrender --needed --noconfirm
sudo pacman -S lib32-libjpeg6-turbo --needed --noconfirm
sudo pacman -S lib32-libxtst --needed --noconfirm


package="teamviewer"
command="teamviewer"

#----------------------------------------------------------------------------------

#checking if application is already installed or else install with aur helpers
if pacman -Qi $package &> /dev/null; then

	echo "################################################################"
	echo "################## "$package" is already installed"
	echo "################################################################"

else

	#checking which helper is installed
	if pacman -Qi packer &> /dev/null; then

		echo "Installing with packer"
		packer -S --noconfirm --noedit  $package

	elif pacman -Qi pacaur &> /dev/null; then
		
		echo "Installing with pacaur"
		pacaur -S --noconfirm --noedit  $package
		 	
	elif pacman -Qi yaourt &> /dev/null; then

		echo "Installing with yaourt"
		yaourt -S --noconfirm $package
			  	
	fi

	# Just checking if installation was successful
	if pacman -Qi $package &> /dev/null; then
	
	echo "################################################################"
	echo "#########  "$package" has been installed"
	echo "################################################################"

	else

	echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	echo "!!!!!!!!!  "$package" has NOT been installed"
	echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	echo "Teamviewer needs 32 bits applications"
	echo "Go to /etc/pacman.conf and edit these lines"
	echo "[multilib]"
	echo "Include = /etc/pacman.d/mirrorlist"
	echo "Include this mirrorlist as well"
	sleep 2
	fi

fi

sudo systemctl enable teamviewerd.service
sudo systemctl start teamviewerd.service
