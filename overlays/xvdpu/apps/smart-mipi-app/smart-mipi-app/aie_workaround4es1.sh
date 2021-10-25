#!/bin/sh -e

# AIE workaround for VCK190 ES1 board in 2021.1 version
for i in {0..39}
do
	for j in {1..8}
	do
		a=0x20000000000
		b=0x31000
		devmem $[a+b+(i<<23)+(j<<18)] 32 0
	done
done

