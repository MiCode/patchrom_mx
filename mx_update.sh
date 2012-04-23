#! /bin/bash
#make clean

#make fullota

adb shell mv /data/local/tmp /data/local/tmp.bak
adb shell ln -s /data /data/local/tmp
adb reboot
adb wait-for-device
adb shell rm /data/local.prop > nul
adb shell "echo \"ro.kernel.qemu=1\" > /data/local.prop"
adb reboot
adb wait-for-device
adb shell id
if [ -d out/temp ];then
	rm -rf out/temp
fi

unzip > /dev/null out/fullota.zip -d out/temp
adb remount
adb shell stop

DIR_PREFIX=out/temp/system
adb shell rm /system/app/*
adb shell rm /system/framework/*.odex
adb push $DIR_PREFIX/app /system/app

adb push $DIR_PREFIX/framework/framework.jar /system/framework/framework.jar
adb push $DIR_PREFIX/framework/android.policy.jar /system/framework/android.policy.jar
adb push $DIR_PREFIX/framework/services.jar /system/framework/services.jar
adb push $DIR_PREFIX/framework/miui-framework.jar /system/framework/miui-framework.jar
adb push $DIR_PREFIX/build.prop  /system/build.prop


adb push $DIR_PREFIX/framework/framework-miui-res.apk /system/framework/framework-miui-res.apk
adb push $DIR_PREFIX/framework/framework-res.apk /system/framework/framework-res.apk
#push xbin
XBIN_FILE=invoke-as
adb push $DIR_PREFIX/xbin/$XBIN_FILE /system/xbin/$XBIN_FILE
adb shell chown 0,0 /system/xbin/$XBIN_FILE
adb shell chmod 06755 /system/xbin/$XBIN_FILE
XBIN_FILE=busybox
adb push $DIR_PREFIX/xbin/$XBIN_FILE /system/xbin/$XBIN_FILE
adb shell chown 0,0 /system/xbin/$XBIN_FILE
adb shell chmod 06755 /system/xbin/$XBIN_FILE
#XBIN_FILE=su
adb push $DIR_PREFIX/xbin/$XBIN_FILE /system/xbin/$XBIN_FILE
adb shell chown 0,0 /system/xbin/$XBIN_FILE
adb shell chmod 06755 /system/xbin/$XBIN_FILE


adb push $DIR_PREFIX/etc/apns-conf.xml /system/etc/apns-conf.xml
adb push $DIR_PREFIX/etc/telocation.db /system/etc/telocation.db
adb push $DIR_PREFIX/etc/yellowpage.db /system/etc/yellowpage.db

adb push $DIR_PREFIX/lib/content-types.properties /system/lib/content-types.properties
#push media for changing some resources
adb push $DIR_PREFIX/media /system/media
#push miui-framework.xml for the permission of miui-framework.jar
adb push $DIR_PREFIX/etc/license /system/etc/license
adb push $DIR_PREFIX/etc/permissions/miui-framework.xml /system/etc/permissions/miui-framework.xml 
adb reboot
adb wait-for-device
adb shell start
adb shell rm /data/local/tmp
adb shell rm /data/local.prop
adb shell mv /data/local/tmp.bak /data/local/tmp
adb shell "wipe data"
echo "update ok after reboot"
adb reboot


