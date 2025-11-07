#!/bin/sh
TARGET=archlinux.qcow2

if [ ! -f ${TARGET} ]
then
	echo "create img"
	qemu-img create -f qcow2 ${TARGET} 16G
fi

qemu-system-x86_64 \
        -enable-kvm \
        -cpu host,kvm=off \
        -m 4G \
        -smp cores=4 \
	-drive file=${TARGET},if=virtio \
	-display sdl,grab-mod=rctrl \
	-nic user,hostfwd=tcp::2223-:22 \
	-device virtio-keyboard-pci \
	-device virtio-tablet-pci \
	-audiodev alsa,id=audio0,out.dev=default,in.dev=default \
	-device ac97,audiodev=audio0 \
        $@ &

unset TARGET
