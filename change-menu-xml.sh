#!/bin/bash
set -e
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

echo "Let us change all software to our personal preferences."

# new application with capital first letter like rest in menu
# old one does not matter
app1old=audacious
app1new=Deadbeef
#app2old=
#app2new=
#app3old=
#app3new=

echo "The file ~/.config/openbox/menu.xml will be changed."
echo "We will change all old apps with the new ones!"
echo "Did you backup? Can I change it?  (y/n) "
read response
if [[ "$response" == [yY] ]]; then
    echo "Changing all instances";
    sed -i 's/'$app1old'/'$app1new'/Ig' ~/.config/openbox/menu.xml
 #   sed -i 's/'$app2old'/'$app2new'/Ig' ~/.config/openbox/menu.xml
 #   sed -i 's/'$app3old'/'$app3new'/Ig' ~/.config/openbox/menu.xml

    echo "All done"
	notify-send -u normal "All versions have been updated. Carry on!"

    else
    	echo "################################################################" 
        echo "Nothing has been changed.";
		notify-send -u normal "Nothing has changed!"
fi


