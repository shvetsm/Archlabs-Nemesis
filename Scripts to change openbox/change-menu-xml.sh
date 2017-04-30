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

app1old=audacious
app1new=deadbeef
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
    #label needs to have a first capital letter
    app1newcapital=${app1new[@]^}
    sed -i 's/<item label="'$app1old'/<item label="'$app1newcapital'/Ig' ~/.config/openbox/menu.xml
    #changing command - no captital letter!
    sed -i 's/<command>'$app1old'/<command>'$app1new'/Ig' ~/.config/openbox/menu.xml
    
	#copy/paste for more instances
	
    #application 2
    #label needs to have a first capital letter
    app2newcapital=${app2new[@]^}
    sed -i 's/<item label="'$app2old'/<item label="'$app2newcapital'/Ig' ~/.config/openbox/menu.xml
    #changing command - no captital letter!
    sed -i 's/<command>'$app2old'/<command>'$app2new'/Ig' ~/.config/openbox/menu.xml


    echo "All done"
	notify-send -u normal "All instances have been updated. Carry on!"

    else
    	echo "################################################################" 
        echo "Nothing has been changed.";
		notify-send -u normal "Nothing has changed!"
fi


