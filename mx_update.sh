#! /bin/bash
#must got root permission before upgrade

make clean

make zipfile
if [ -d out/temp ];then
	rm -rf out/temp
fi
unzip > /dev/null out/MIUI_mx.zip -d out/temp
adb remount
#adb shell su
#adb shell mount -o remount,rw /system
#adb push temp/system/app/ /system/app
#adb push temp/system/framework /system/framework
DIR_PREFIX=out/temp/system
adb push $DIR_PREFIX/app /system/app
adb push $DIR_PREFIX/framework/framework.jar /system/framework/framework.jar
adb push $DIR_PREFIX/framework/android.policy.jar /system/framework/android.policy.jar
adb push $DIR_PREFIX/framework/services.jar /system/framework/services.jar
adb push $DIR_PREFIX/framework/miui-framework.jar /system/framework/miui-framework.jar

adb push $DIR_PREFIX/framework/framework-miui-res.apk /system/framework/framework-miui-res.apk
adb push $DIR_PREFIX/framework/framework-res.apk /system/framework/framework-res.apk

#push media for changing some resources
adb push $DIR_PREFIX/media /system/media
#push miui-framework.xml for the permission of miui-framework.jar
adb push $DIR_PREFIX/etc/permissions/miui-framework.xml /system/etc/permissions/miui-framework.xml 
#push invoke-as for fix MIUI-home bug
#push su,busybox, dexdump?
adb push $DIR_PREFIX/xbin /system/xbin
adb reboot

