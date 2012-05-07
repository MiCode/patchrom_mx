#! /bin/bash
#make clean

#make fullota
#start root
adb shell mv /data/local/tmp /data/local/tmp.bak
adb shell ln -s /data /data/local/tmp
adb reboot
adb wait-for-device
adb shell rm /data/local.prop > /dev/null
adb shell "echo \"ro.kernel.qemu=1\" > /data/local.prop"
adb reboot
adb wait-for-device
adb shell id


adb remount

adb push other/installd/installd /system/bin/installd
adb shell chown 0,0 /system/bin/installd
adb shell chmod 0755 /system/bin/installd 

adb push other/installd/liblbesec.so /system/lib/liblbesec.so

adb shell mkdir /system/media/res
adb push other/recovery/recovery /system/bin/recovery
adb shell chown 0,0 /system/bin/recovery
adb shell chmod 0755 /system/bin/recovery
adb push other/recovery/res /system/media/res
adb push other/recovery/recovery.fstab /system/etc/recovery.fstab

#end root

adb shell start
adb shell rm /data/local/tmp
adb shell rm /data/local.prop
adb shell mv /data/local/tmp.bak /data/local/tmp
adb reboot
