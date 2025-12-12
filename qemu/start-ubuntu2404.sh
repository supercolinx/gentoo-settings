#!/bin/sh
TARGET=ubuntu2404.qcow2

if [ ! -f ${TARGET} ]
then
	echo "create img"
	qemu-img create -f qcow2 ${TARGET} 16G
fi

qemu-system-x86_64 \
	-machine type=q35,accel=kvm \
        -cpu host \
        -m 4G \
	-smp cpus=4,cores=4 \
	-drive file=${TARGET},if=virtio \
	-display sdl,gl=on,grab-mod=rctrl \
	-device virtio-keyboard-pci \
	-device virtio-tablet-pci \
	-audiodev alsa,id=audio0,out.dev=default,in.dev=default \
	-device ac97,audiodev=audio0 \
	-nic user,hostfwd=tcp::2222-:22 \
        $@ &

unset TARGET
