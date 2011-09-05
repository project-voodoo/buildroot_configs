#!/bin/bash


copy () {
	echo -e "\nSaving $1\n"

	cp -v ./build/$1/buildroot-*/output/build/busybox-1.18.5/.config \
		configs/$1/busybox.config

	cp -v ./build/$1/buildroot-*/output/toolchain/uClibc-0.9.32/.config \
		configs/$1/uclibc.config

	cp -v ./build/$1/buildroot-*/.config \
		configs/$1/buildroot.config
}

copy report-tool
copy ota-root-keeper

