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

# all small letters

app1old=xfce4-screenshooter
app1new=gnome-screenshot

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
    
    #application 1
    sed -i 's/<command>'$app1old'/<command>'$app1new'/g' ~/.config/openbox/rc.xml
    sed -i 's/'$app1new'/& -i/g' ~/.config/openbox/rc.xml
    
	#copy/paste for more instances
	#application 2
    #sed -i 's/<command>'$app2old'/<command>'$app2new'/Ig' ~/.config/openbox/rc.xml


    echo "All done"
	notify-send -u normal "All instances have been updated. Carry on!"

    else
    	echo "################################################################" 
        echo "Nothing has been changed.";
		notify-send -u normal "Nothing has changed!"
fi


