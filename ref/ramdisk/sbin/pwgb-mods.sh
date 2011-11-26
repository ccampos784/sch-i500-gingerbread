#!/system/bin/sh

######################################
##           PWGB Kernel            ##
##      Based off EH09 source       ##
##          By ccampos784           ##
######################################

## POST-BOOT SCRIPT ##

# Remount /system rw
busybox mount -o remount,rw /
busybox mount -o remount,rw /system

# Install liblights
busybox cp -f /res/lights.s5pc110.so /system/lib/hw/lights.s5pc110.so
busybox chown root.root /system/lib/hw/lights.s5pc110.so
busybox chmod 0644 /system/lib/hw/lights.s5pc110.so

# Install bootanimation binary
busybox cp -f /sbin/bootanimation /system/bin/bootanimation
busybox chown root.shell /system/bin/bootanimation
busybox chmod 0755 /system/bin/bootanimation

# Bootanimation hack
while [ 1 ]; do
  sleep 1;
  if pgrep android.process.acore; then
      sleep 5;
      busybox pkill bootanimation
      busybox pkill samsungani
      exit;
  fi
done

# Disable IOSTATS to reduce overhead
STL=`ls -d /sys/block/stl*`;
BML=`ls -d /sys/block/bml*`;
MMC=`ls -d /sys/block/mmc*`;
for k in $STL $BML $MMC;
do
 echo "0" > $k/queue/iostats
done

# Remount /system ro
busybox mount -o remount,ro /
busybox mount -o remount,ro /system
