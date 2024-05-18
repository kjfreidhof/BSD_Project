#!/usr/bin/env sh 

p="pkgconf"
Display_info="Make sure to run the intel video script to install xorg and the intel video drivers"

Install_conf() {
	doas pkg install "$p"
	for d in "$Display_info"; do 
		echo "$d"
		sleep 5
		exit 0


	done


}

Install_conf
