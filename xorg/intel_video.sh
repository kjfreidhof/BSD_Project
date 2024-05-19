#!/usr/bin/env sh

p="pkg.txt"
rc_path="/etc/rc.conf"

Install_video() {
if [ ! -f "$p" ]; then
    echo "file not found"
    exit 1
fi

while IFS= read -r pkg || [ -n "$pkg" ]
do
    if [ -z "$pkg" ] || [ "${pkg#\#}" != "$pkg" ]; then
        continue
    fi

    echo "Attempting to install: $pkg"
    doas env ASSUME_ALWAYS_YES=YES pkg install "$pkg"

    if [ $? -ne 0 ]; then
        echo "Failed to install: $pkg"
    else
        echo "Successfully installed: $pkg"
    fi
done < "$p"


printf "Do you want to overwrite the existing rc.conf file [y/n] \n"
read -r choice 

if [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
	doas cp Intel_rc.conf "$rc_path"

fi 	
exit 0
}
Install_video
