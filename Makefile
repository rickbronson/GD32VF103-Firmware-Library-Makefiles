# 
# Copyright (C) 2015 Rick Bronson (rick AT efn.org)
# Licensed under the GPL
#
# Makefile that get's used for all projects (under Examples/*)

# all the files will be generated with this name (main.elf, main.bin, main.hex, etc)
all:
	tar xjf GD32VF103_Firmware_Library_V1.0.2.tar.bz2
	tar xjf GD32VF103_Firmware_Library-overlay-6.tar.bz2
# fix up error in riscv-openocd
	sed -i -e "s/uint32_t access = 0;/long unsigned int access = 0;/" \
		-e "s/if (check_sbcs_status(target, /if (check_sbcs_status(target, (uint32_t *) /" \
		-e "s/uint32_t num_sbdata_regs;/uint32_t num_sbdata_regs = 0;/"  riscv-openocd/src/target/riscv/riscv-013.c
	cd riscv-openocd; ./bootstrap
	cd riscv-openocd; ./configure
	cd riscv-openocd; make
	cd GD32VF103_Firmware_Library_V1.0.2; make

