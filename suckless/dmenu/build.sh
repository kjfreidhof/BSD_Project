#!/usr/bin/env sh 
build=$(make && doas make clean install)

build_dmenu() {
	for b in "$build"; do
		"$b"
		exit 0


	done
}

build_dmenu
