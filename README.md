  GD32VF103_Firmware_Library Makefiles
==========================================

This is everything you need to build the GD32VF103_Firmware_Library using Makefiles under Linux.  It consists of an upper level Makefile that un-archive's the GD32VF103_Firmware_Library, then un-archives an overlay tar.bz2 that provides Makefiles and a few fix-up's so we can build.

I had tried in vain to use the DFU loader (I tried several versions of dfu-util inclding gd32-dfu-utils) that came with my Longan Nano but it was so flaky I gave up and used a Segger Jlink to flash.  It seemed to work *sometimes* with small binaries but almost always failed with larger ones.

Debian Buster was used to build.

  Instructions

1. Make sure you have all the necessary packages to build.

```
sudo apt-get install autoconf automake autotools-dev curl python3 libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev libusb-1.0-0 util-linux libncurses5 pkg-config
```

  If you will be using a USB serial port, add yourself to the dialout group:

```
sudo usermod -a -G dialout $USER
```

  If you plan on using a Jlink, download the latest Jlink deb (like JLink_Linux_V680d_x86_64.deb) and install via:

```
sudo dpkg -i JLink_Linux_V680d_x86_64.deb
```

  This should install /etc/udev/rules.d/99-jlink.rules for you.  Reboot to get the new rules.
	

2. Get the build tools:

Go to http://dl.sipeed.com/LONGAN/platformio/dl-packages and download the latest build tools (something like toolchain-gd32v-v9.2.0-linux.tar.gz).  You might have to preface the following commands with "sudo".

```
mkdir /opt/riscv
tar zxf ~/Downloads/toolchain-gd32v-v9.2.0-linux.tar.gz -C /opt/riscv 
```

3. Un-archive and build everything:

```
git clone --recursive https://github.com/rickbronson/GD32VF103-Firmware-Library-Makefiles.git
cd GD32VF103-Firmware-Library-Makefiles
make
```

3. Build a single target

  You can build from the root library dir (GD32VF103_Firmware_Library_V1.0.2):
	
```
cd GD32VF103_Firmware_Library_V1.0.2
make USART/Printf
```

  Or you can build from the directory that contains the main.c or app.c:

```
cd GD32VF103_Firmware_Library_V1.0.2/Examples/USART/Printf
make
```

3. Hookup
--------------

Simplified hookup of the Longan Nano board with serial and Jlink JTAG
![Jtag hookup](https://github.com/rickbronson/GD32VF103-Firmware-Library-Makefiles/blob/master/Jtag-hookup3.png "Jtag hookup")

4. Comments/suggestions

  Please contact me at rick AT efn DOT org
