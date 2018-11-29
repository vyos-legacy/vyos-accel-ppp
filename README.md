# vyos-accel-ppp
accel-ppp debianized for vyos

You need the kernel sources available it the headers. The source should be under /usr/src/linux (ln -s ...) accessible.
Within the kernel source run 'make oldconfig && make prepare && make scripts'.
Tell gcc where to find the kernel headers via: 'export C_INCLUDE_PATH=/usr/src/linux-headers-4.19.0-amd64-vyos' and the kernel sources via 'export KERNELDIR=/path/to/kernel/sources'

Now execute: dpkg-buildpackage -b -us -uc -tc

It should compile everything and will spit out 3 packages:

vyos-accel-ppp_1.11.2-2_amd64.deb - contains all required binaries, libs lua scripts etc.
vyos-accel-ppp-doc_1.11.2-2_all.deb - optional documentation packages, manpages and that stuff
vyos-accel-ppp-ipoe-kmod_1.11.2-2_amd64.deb - ipoe.ko and vlan_mon.ko for 4.19.0-amd64-vyos

