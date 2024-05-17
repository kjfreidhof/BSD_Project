#!/usr/bin/env sh
list=$(bectl list)
error_message="Error: Must choose a number from 1-6"

list_snaps() {
	"$list"

}

create_snap() {
	printf "Choose a name for your snapshot? \n"
	read -r name 
	doas bectl create "$name"
}

act_snap() {
	printf "Choose a snapshot to activate \n"
	"$list"
	read -r shot
	doas bectl activate "$shot"

}

dest_snap() {
	printf "Choose a snapshot to destroy. (Caution once its gone its gone) \n"
	read -r dest
	"$list"
	doas bectl destroy -o "$dest"

}


while true; do 
	echo "1: list snapshots"
	echo "2: create snapshots"
	echo "3: Activate snapshots"
	echo "4: destroy snapshots"
	echo "5: exit"
	read -r option
	case "$option" in
		1)
			list_snaps > snapshots.txt
			less snapshots.txt 
			rm snapshots.txt
			;;


		2)
			create_snap
			;;

		3)
			act_snap
			;;

		4)
			dest_snap
			;;

		5)
			exit 0
			;;

		*)
			exit 0
			;;


	esac

done
