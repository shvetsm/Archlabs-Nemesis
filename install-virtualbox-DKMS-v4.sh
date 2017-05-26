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

sudo pacman -S --noconfirm --needed virtualbox-host-dkms
sudo pacman -S --noconfirm --needed linux-headers
sudo pacman -S --noconfirm --needed linux-lts-headers


package="virtualbox"
command="virtualbox"

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

	fi

fi


# Archlab has already virtualbox-host-dkms installed

# package="virtualbox-host-modules-arch"


# #----------------------------------------------------------------------------------

# #checking if application is already installed or else install with aur helpers
# if pacman -Qi $package &> /dev/null; then

# 	echo "################################################################"
# 	echo "################## "$package" is already installed"
# 	echo "################################################################"

# else

# 	#checking which helper is installed
# 	if pacman -Qi packer &> /dev/null; then

# 		echo "Installing with packer"
# 		echo "confirm installation of virtualbox-host-modules-arch"
# 		packer -S --noedit  $package

# 	elif pacman -Qi pacaur &> /dev/null; then
		
# 		echo "Installing with pacaur"
# 		pacaur -S --noconfirm --noedit  $package
		 	
# 	elif pacman -Qi yaourt &> /dev/null; then

# 		echo "Installing with yaourt"
# 		yaourt -S --noconfirm $package
			  	
# 	fi

# 	# Just checking if installation was successful
# 	if pacman -Qi $package &> /dev/null; then
	
# 	echo "################################################################"
# 	echo "#########  "$package" has been installed"
# 	echo "################################################################"

# 	else

# 	echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
# 	echo "!!!!!!!!!  "$package" has NOT been installed"
# 	echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"

# 	fi

# fi


	echo "################################################################"
	echo "#########           You got to reboot.                 #########" 
	echo "################################################################"
