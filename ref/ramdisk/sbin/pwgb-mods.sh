#!/system/bin/sh

# Remount /system rw
busybox mount -o remount,rw /
busybox mount -o remount,rw /system

# Install liblights
busybox cp -f /res/liblights/lights.s5pc110.so /system/lib/hw/lights.s5pc110.so
busybox chown root.root /system/lib/hw/lights.s5pc110.so
busybox chmod 0644 /system/lib/hw/lights.s5pc110.so

# Remount /system ro
busybox mount -o remount,ro /
busybox mount -o remount,ro /system
