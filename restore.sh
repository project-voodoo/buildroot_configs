#!/bin/bash

restore() {

	cd build/$1/buildroot*/ || exit 1
	
	cp -v ../../../configs/$1/buildroot.config .config

	make uclibc-menuconfig
	cp -v ../../../configs/$1/uclibc.config output/toolchain/uClibc-*/.config

	make busybox-configure
	cp -v ../../../configs/$1/busybox.config output/build/busybox-*/.config
}

if test -n "$1" && test -d configs/"$1"; then
	echo -e "\nRestoring $1\n"
	restore $1
fi
