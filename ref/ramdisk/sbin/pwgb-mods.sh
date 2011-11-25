#!/system/bin/sh

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

# Remount /system ro
busybox mount -o remount,ro /
busybox mount -o remount,ro /system
